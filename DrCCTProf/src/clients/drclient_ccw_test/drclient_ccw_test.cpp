/* 
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

/* Client Sample:
 * ccw_test.cpp
 *
 * This sample client will display the top 200 instructions with their execution times and
 * calling paths in the output file.
 *
 * If you are new to the DynamoRIO Dynamic Binary Instrumentation (DBI) tool platform in
 * general, and DynamoRIO in particular, ensure you understand the method by which
 * instrumentation is added to application code.
 *
 * Remember that instrumentation occurs in two phases, transformation and execution:
 * - Transformation
 *      Instrumentation code is inserted into the application code.
 * - Execution
 *      The application code runs, including the instrumentation code which was inserted
 *      during transformation.
 */

#include <iterator>
#include <vector>
#include <unordered_map>
#include <sys/resource.h>
#include <sys/time.h>
#include <fstream>
#include <string>
#include <unistd.h>

#include "dr_api.h"
#include "dr_events.h"
#include "droption.h"
#include "drsyms.h"
#include "drmgr.h"
//#include "drwrap.h"
#include "drx.h"
using namespace std;


//------------------------------------------------------
// Macros
//------------------------------------------------------
#define INIT_LOG_FILE_NAME(_BUFFER, _CCW_DIR, _BENCH, TLS_IDX)                       \
    do {                                                                             \
        sprintf(_BUFFER + strlen(_BUFFER), "%s/ccwtest-%s-%d-%d.log", _CCW_DIR, _BENCH, getpid(), TLS_IDX); \
    } while (0)

//#define BUFFER_SIZE_BYTES(buf) sizeof(buf)
//#define BUFFER_SIZE_ELEMENTS(buf) (BUFFER_SIZE_BYTES(buf) / sizeof((buf)[0]))
//#define BUFFER_LAST_ELEMENT(buf) (buf)[BUFFER_SIZE_ELEMENTS(buf) - 1]
//#define NULL_TERMINATE_BUFFER(buf) BUFFER_LAST_ELEMENT(buf) = 0

//#ifdef WINDOWS
//#    define IF_WINDOWS(x) x
//#else
//#    define IF_WINDOWS(x) /* nothing */
//#endif
//
//#ifdef WINDOWS
//#    define IF_WINDOWS(x) x
//#    define IF_UNIX_ELSE(x, y) y
//#else
//#    define IF_WINDOWS(x)
//#    define IF_UNIX_ELSE(x, y) x
//#endif
//
//#ifdef WINDOWS
//#    define DISPLAY_STRING(msg) dr_messagebox("%s", msg)
//#    define IF_WINDOWS(x) x
//#else
//#    define DISPLAY_STRING(msg) dr_printf("%s\n", msg);
//#    define IF_WINDOWS(x) /* nothing */
//#endif

//------------------------------------------------------
// Options
//------------------------------------------------------
static droption_t<std::string> op_ccw
(DROPTION_SCOPE_CLIENT, "ccw", "", "CCWeight", "File Path of ccw");

static droption_t<std::string> op_bench
(DROPTION_SCOPE_CLIENT, "bench", "", "Benchmark", "Benchmark name");

static droption_t<std::string> op_ccw_dir
(DROPTION_SCOPE_CLIENT, "ccwdir", "", "Directory of ccweight", "Directory of ccweight");

static droption_t<std::string> op_bin_path
(DROPTION_SCOPE_CLIENT, "bin_path", "", "binary path", "binary path");

//------------------------------------------------------
// Global variables
//------------------------------------------------------
static int tls_idx;
static client_id_t my_id;

uint64_t process_start_time;
uint64_t process_end_time;

int g_prog_status = 0; // 0: Program start up, 1: Program running, 2: Program termination
uint64_t g_first_call, g_last_call;

std::unordered_map<uint64_t, uint64_t> CCW_DIRECT; // callsite -> ccw
std::unordered_map<uint64_t, std::unordered_map<uint64_t, uint64_t>> CCW_INDIRECT; // callsite -> callee --> ccw

//------------------------------------------------------
// Statistics
//------------------------------------------------------
#ifdef DCCE_STATS
std::unordered_map<uint64_t, std::pair<uint64_t,uint64_t>> tid2numcalls;
#endif


#define ATOMIC_ADD_THREAD_ID_MAX(origin) dr_atomic_add32_return_sum(&origin, 1)
#define THREAD_MAX_NUM 8192
typedef struct _per_thread_t {
    uint64_t tid;
    uint64_t ccid;
    uint64_t ccw;
#ifdef DCCE_STATS
    uint64_t num_direct_calls;
    uint64_t num_indirect_calls;
    uint64_t stack_depth;
#endif
} per_thread_t;
static int global_thread_id_max = 0;
static uint64_t max_stack_depth = 0;
//static per_thread_t **global_pt_cache_buff;

//------------------------------------------------------
// Functions for CCW
//------------------------------------------------------

void split(std::string str, std::string delimiter, std::vector<std::string> &list)
{
    //std::string s = "scott>=tiger>=mushroom";
    //delimiter = ">=";
    std::string s = str;
    size_t pos = 0;
    std::string token;
    while ((pos = s.find(delimiter)) != std::string::npos) {
        token = s.substr(0, pos);
        list.push_back(token);
        s.erase(0, pos + delimiter.length());
    }
    list.push_back(s);
}


static void
read_ccw_file(std::string fname)
{
    dr_fprintf(STDOUT, "opening ccw file - fname %s\n", fname.c_str());
    std::ifstream ccwfile(fname.c_str());
    std::string line;
    bool first = true;
    if (ccwfile.is_open()) {
        while (getline(ccwfile, line)) {
            //dr_fprintf(STDOUT, "reading a line %s\n", line.c_str());
            if (first) {
                std::vector<std::string> first_last;
                split(line, ",", first_last);
                DR_ASSERT(first_last.size() == 3);
                g_first_call = std::strtoul(first_last[0].c_str(), NULL, 16);
                g_last_call = std::strtoul(first_last[1].c_str(), NULL, 16);
                first = false;
                //dr_fprintf(STDOUT, "start_call: %p last_call: %p\n", g_first_call, g_last_call);
                continue;
            }

            std::vector<std::string> list;
            split(line, ":", list);
            DR_ASSERT(list.size() == 2);

            uint64_t callsite_addr = std::strtoul(list[0].c_str(), NULL, 16);

            std::string callee2ccw = list[1];
            list.clear();
            split(callee2ccw, ",", list);

            DR_ASSERT(list.size() >= 2);
            if (list.size() == 2) {
                std::vector<std::string> c2w;
                split(list[0], "-", c2w);
                uint64_t callee_addr = std::strtoul(c2w[0].c_str(), NULL, 16);
                uint64_t ccw = std::strtoul(c2w[1].c_str(), NULL, 10);
                CCW_DIRECT[callsite_addr] = ccw;
                //dr_fprintf(STDOUT, "DIRECT_CALL %p -> %p : %d\n", callsite_addr, callee_addr, ccw);

            } else {
                std::vector<std::string> c2w;
                for (unsigned int i = 0; i < list.size()-1; i++) {
                    split(list[i], "-", c2w);
                    uint64_t callee_addr = std::strtoul(c2w[0].c_str(), NULL, 16);
                    uint64_t ccw = std::strtoul(c2w[1].c_str(), NULL, 10);
                    CCW_INDIRECT[callsite_addr][callee_addr] = ccw;
                    //dr_fprintf(STDOUT, "INDIRECT_CALL %p -> %p : %d\n", callsite_addr, callee_addr, ccw);
                    c2w.clear();

                }
            }
        }
    }
}

uint64_t
get_ccw_direct(uint64_t callsite, uint64_t callee)
{
    //dr_fprintf(STDOUT, "get_ccw %p -> %p\n", callsite, callee);
    if (CCW_DIRECT.find(callsite) != CCW_DIRECT.end()) {
        return CCW_DIRECT[callsite];
    } else {
        //dr_fprintf(STDOUT,
        //           "\nCCW Test Failed to find ccw because unknown callsite. callsite: %p callee: %p\n",
        //           callsite, callee);
        //DR_ASSERT(false);
    }
    return 0; //make compiler happy
}

uint64_t
get_ccw_indirect(uint64_t callsite, uint64_t callee)
{
    //dr_fprintf(STDOUT, "get_ccw %p -> %p\n", callsite, callee);
    if (CCW_INDIRECT.find(callsite) != CCW_INDIRECT.end()) {
        if (CCW_INDIRECT[callsite].find(callee) != CCW_INDIRECT[callsite].end()) {
            return CCW_INDIRECT[callsite][callee];
        } else {
            //dr_fprintf(STDOUT,
            //           "\nCCW Test Failed to find ccw because unknown callee. callsite: %p callee: %p\n",
            //           callsite, callee);
            //DR_ASSERT(false);
        }
    } else {
        //dr_fprintf(STDOUT,
        //           "\nCCW Test Failed to find ccw because unknown callsite. callsite: %p callee: %p\n",
        //           callsite, callee);
        //DR_ASSERT(false);
    }

    return 0; //make compiler happy
}

//------------------------------------------------------
// Callback functions at call/call_ind/return
//------------------------------------------------------
static void
at_call(app_pc instr_addr, app_pc target_addr)
{
    //dr_fprintf(STDOUT, "at_call callsite: %p jump target: %p\n",
    //           instr_addr, target_addr);

    //if (g_prog_status == 2) return;

   
    //if (0 == g_prog_status) {
    //    if (g_first_call == (uint64_t)instr_addr) {
    //        //dr_fprintf(STDOUT, "Start main function\n");
    //        g_prog_status = 1;
    //    }
    //}

    //if (g_prog_status != 1) {
    //    return;
    //}

    uint64_t ccw_value = get_ccw_direct((uint64_t)instr_addr, (uint64_t)target_addr);
    // TODO: is it possible to skip updateing ccid if ccw is zero?
    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
    DR_ASSERT(pt != NULL); // TODO: remove it when geeting the final result
    pt->ccid += ccw_value;
    pt->ccw = ccw_value;
#ifdef DCCE_STATS
    pt->num_direct_calls++;
    pt->stack_depth++;
#endif

    //if (g_barrier_call == (uint64_t)target_addr) {
    //    //printf("[t%lu] barrier called at ccid: %lu\n", pt->tid, pt->ccid);
    //    if (barrier2cnt.find((uint64_t)instr_addr) == barrier2cnt.end()) {
    //        barrier2cnt[(uint64_t)instr_addr] = 0;
    //    }
    //    barrier2cnt[(uint64_t)instr_addr]++;
    //}

    //if (cs2cnt.find((uint64_t)instr_addr) == cs2cnt.end()) {
    //    cs2cnt[(uint64_t)instr_addr] = 0;
    //}
    //cs2cnt[(uint64_t)instr_addr]++;

    //dr_fprintf(STDOUT, "at_call callsite: %p jump target: %p ccid: %ul\n",
    //           instr_addr, target_addr, pt->ccid);
}

static void
at_call_ind(app_pc instr_addr, app_pc target_addr)
{
    //dr_fprintf(STDOUT, "at_call_ind callsite: %p jump target: %p\n",
    //           instr_addr, target_addr);

    //if (g_prog_status == 2) return;

   
    //if (0 == g_prog_status) {
    //    if (g_first_call == (uint64_t)instr_addr) {
    //        //dr_fprintf(STDOUT, "Start main function\n");
    //        g_prog_status = 1;
    //    }
    //}

    //if (g_prog_status != 1) {
    //    return;
    //}

    uint64_t ccw_value = get_ccw_indirect((uint64_t)instr_addr, (uint64_t)target_addr);
    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
    DR_ASSERT(pt != NULL); // TODO: remove it when geeting the final result
    pt->ccid += ccw_value;
    pt->ccw = ccw_value;
#ifdef DCCE_STATS
    pt->num_indirect_calls++;
    pt->stack_depth++;
#endif

    //if (g_barrier_call == (uint64_t)target_addr) {
    //    //printf("[t%lu] barrier called at ccid: %lu\n", pt->tid, pt->ccid);
    //    if (barrier2cnt.find((uint64_t)instr_addr) == barrier2cnt.end()) {
    //        barrier2cnt[(uint64_t)instr_addr] = 0;
    //    }
    //    barrier2cnt[(uint64_t)instr_addr]++;
    //}

    //if (cs2cnt.find((uint64_t)instr_addr) == cs2cnt.end()) {
    //    cs2cnt[(uint64_t)instr_addr] = 0;
    //}
    //cs2cnt[(uint64_t)instr_addr]++;

    //dr_fprintf(STDOUT, "at_call_ind callsite: %p jump target: %p ccid: %ul\n",
    //           instr_addr, target_addr, pt->ccid);
}

void
at_return(app_pc instr_addr, app_pc target_addr)
{
    //dr_fprintf(STDOUT, "at_return retsite: %p jump target: %p\n",
    //           instr_addr, target_addr);

    //if (g_prog_status != 1) return;

    //if ((uint64_t)target_addr == g_last_call) {
    //    g_prog_status = 2;
    //    //dr_fprintf(STDOUT, "Finished main function\n");
    //}
    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
    DR_ASSERT(pt != NULL); // TODO: remove it when geeting the final result
    pt->ccid -= pt->ccw;
#ifdef DCCE_STATS
    pt->stack_depth--;
#endif
    //dr_fprintf(STDOUT, "at_ret retsite: %p jump target: %p ccid: %ul\n",
    //           instr_addr, target_addr, pt->ccid);
}

//------------------------------------------------------
// Functions for init clients
//------------------------------------------------------
static dr_emit_flags_t
event_app_instruction(void *drcontext, void *tag,
                      instrlist_t *bb, instr_t *instr,
                      bool for_trace, bool translating,
                      void *user_data)
{
    if (instr_is_call_direct(instr)) {
        dr_insert_call_instrumentation(drcontext, bb, instr, (app_pc)at_call);
    } else if (instr_is_call_indirect(instr)) {
        dr_insert_mbr_instrumentation(drcontext, bb, instr, (app_pc)at_call_ind,
                                      SPILL_SLOT_1);
    } else if (instr_is_return(instr)) {
        dr_insert_mbr_instrumentation(drcontext, bb, instr, (app_pc)at_return,
                                      SPILL_SLOT_1);
    }
    return DR_EMIT_DEFAULT; 
}

static void
event_thread_init(void *drcontext)
{
    //dr_fprintf(STDOUT, "event_thread_init tls_idx: %d\n", tls_idx);

    //char name[256] = "";
    //INIT_LOG_FILE_NAME(name, op_ccw_dir.get_value().c_str(), op_bench.get_value().c_str(), tls_idx);
    //dr_fprintf(STDOUT, "Creating log file at:%s", name);
    int id = ATOMIC_ADD_THREAD_ID_MAX(global_thread_id_max);
    id--;
    if (id > THREAD_MAX_NUM) {
        dr_fprintf(STDOUT,
            "Thread num > THREAD_MAX_NUM(%d), please change the value of THREAD_MAX_NUM.",
            THREAD_MAX_NUM);
        DR_ASSERT(false);
    }
    per_thread_t *pt = (per_thread_t *)dr_global_alloc(sizeof(per_thread_t));
    DR_ASSERT(pt != NULL);
    pt->ccid = 0;
    pt->ccw = 0;
    pt->tid = id;
#ifdef DCCE_STATS
    pt->num_direct_calls = 0;
    pt->num_indirect_calls = 0;
    pt->stack_depth = 0;
#endif

    //dr_fprintf(STDOUT, "drmgr_set_tls_field tls_idx: %d\n", tls_idx);
    /* store it in the slot provided in the drcontext */
    drmgr_set_tls_field(drcontext, tls_idx, (void *)pt);
}

static void
event_thread_exit(void *drcontext)
{
    //dr_fprintf(STDOUT, "event_thread_exit tls_idx: %d\n", tls_idx);
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
#ifdef DCCE_STATS
    tid2numcalls[pt->tid] = std::make_pair(pt->num_direct_calls, pt->num_indirect_calls);
    if (pt->stack_depth > max_stack_depth) {
        max_stack_depth = pt->stack_depth;
    }
#endif
    //dr_close_file((file_t)(ptr_uint_t)drmgr_get_tls_field(drcontext, tls_idx));
    dr_global_free(pt, sizeof(per_thread_t));
}

static void
client_init(int argc, const char *argv[])
{
    dr_fprintf(STDOUT, "Starting client ccw_test %d\n", my_id);
    std::string parse_err;
    int last_index;
    if (!droption_parser_t::parse_argv(DROPTION_SCOPE_CLIENT, argc, argv, &parse_err, &last_index)) {
        dr_fprintf(STDERR, "Usage error: %s\n", parse_err.c_str());
        dr_abort();
    }

    read_ccw_file(op_ccw.get_value());

    dr_fprintf(STDOUT, "drmgr_init\n");
    drmgr_init();
    dr_fprintf(STDOUT, "drmgr_register_bb_instrumentation_event\n");
    drmgr_register_bb_instrumentation_event(
            NULL, event_app_instruction, NULL);

    // for threads
    dr_fprintf(STDOUT, "drmgr_register_thread_init_event\n");
    drmgr_register_thread_init_event(event_thread_init);
    dr_fprintf(STDOUT, "drmgr_register_thread_exit_event\n");
    drmgr_register_thread_exit_event(event_thread_exit);

    // init drsym
    dr_fprintf(STDOUT, "drsym_init\n");
    drsym_init(0);

    // thread local storage (tls)
    dr_fprintf(STDOUT, "drmgr_register_tls_field\n");
    tls_idx = drmgr_register_tls_field();
    DR_ASSERT(tls_idx > -1);

    struct timeval tv;
    gettimeofday(&tv, NULL);
    process_start_time =  (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
}

static void
client_exit(void)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    process_end_time =  (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);

    uint64_t execution_time = process_end_time - process_start_time;
    dr_fprintf(STDOUT,
               "================== BEGIN STATISTICS ==================\n");
    dr_fprintf(STDOUT,
               "process_start_time: %llu, process_end_time: %llu, execution_time: %llu ms\n",
               process_start_time,
               process_end_time,
               execution_time);

    struct rusage rusage;
    getrusage(RUSAGE_SELF, &rusage);
    dr_fprintf(STDOUT, "PeakRSS = %zu\n", (size_t)rusage.ru_maxrss);

#ifdef DCCE_STATS
    uint64_t total_calls = 0;
    for (auto tid2ncall : tid2numcalls) {
        total_calls += (tid2ncall.second.first + tid2ncall.second.second);
        dr_fprintf(STDOUT,
                   "[t%lu] Direct calls: %lu Indirect calls: %lu\n",
                   tid2ncall.first, tid2ncall.second.first, tid2ncall.second.second);
    }
    dr_fprintf(STDOUT, "Total calls: %lu\n", total_calls);

    uint64_t size_ccw_direct = CCW_DIRECT.size() * sizeof(uint64_t) * 2;

    uint64_t num_cs = CCW_INDIRECT.size();
    uint64_t num_callees = 0;
    for (auto cs2clnw : CCW_INDIRECT) {
        num_callees += cs2clnw.second.size();
    }
    uint64_t size_ccw_indirect = num_cs * num_callees * sizeof(uint64_t) * 3;
    dr_fprintf(STDOUT,
               "Size of CCW_DIRECT: %lu bytes (%lu * %lu * 2)\n",
               size_ccw_direct, CCW_DIRECT.size(), sizeof(uint64_t));
    dr_fprintf(STDOUT,
               "Size of CCW_INDIRECT: %lu bytes (%lu * %lu * %lu * 3)\n",
               size_ccw_indirect, num_cs, num_callees, sizeof(uint64_t));
    dr_fprintf(STDOUT, "Max Stack depth: %lu\n", max_stack_depth);
    //dr_fprintf(STDOUT, "-------------------------\n");
    //dr_fprintf(STDOUT, "callsite | counts\n");
    //dr_fprintf(STDOUT, "-------------------------\n");
    //for (auto item : cs2cnt) {
    //    dr_fprintf(STDOUT, "%p,%lu\n", item.first, item.second);
    //}

    //dr_fprintf(STDOUT, "-------------------------\n");
    //dr_fprintf(STDOUT, "barrier | counts\n");
    //dr_fprintf(STDOUT, "-------------------------\n");
    //for (auto item : barrier2cnt) {
    //    dr_fprintf(STDOUT, "%p,%lu\n", item.first, item.second);
    //}

#endif

    drsym_exit();
    drmgr_unregister_tls_field(tls_idx);
    drmgr_exit();
}


#ifdef __cplusplus
extern "C" {
#endif

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{
    my_id = id;
    dr_set_client_name("DynamoRIO Client 'ccw_test'",
                       "http://dynamorio.org/issues");

    client_init(argc, argv);
    dr_register_exit_event(client_exit);
}

#ifdef __cplusplus
}
#endif
