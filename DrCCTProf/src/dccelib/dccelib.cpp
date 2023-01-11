/* 
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

#include <sys/time.h>
#include <sys/resource.h>
#include <sys/types.h>
#include <signal.h>
#include <cinttypes>
#include <vector>
#include <map>
#include <unordered_map>
#include <unistd.h>
#include <fstream>

#include "libelf.h"

#include "dr_api.h"
#include "drmgr.h"
#include "drreg.h"
#include "drsyms.h"
#include "drutil.h"
#include "drwrap.h"

//------------------------------------------------------
// Global Variables
//------------------------------------------------------
static int tls_idx;
int g_prog_status = 0; // 0: Program start up, 1: Program running, 2: Program termination
uint64_t g_first_call, g_last_call, g_barrier_call;
std::unordered_map<uint64_t, uint64_t> CCW_DIRECT; // callsite -> ccw
std::unordered_map<uint64_t, std::unordered_map<uint64_t, uint64_t>> CCW_INDIRECT; // callsite -> callee --> ccw
void (*InsTransEventCallback)(void *, instrlist_t*, instr_t*);

//------------------------------------------------------
// Thread Local Storage
//------------------------------------------------------
#define ATOMIC_ADD_THREAD_ID_MAX(origin) dr_atomic_add32_return_sum(&origin, 1)
#define THREAD_MAX_NUM 8192
typedef struct _per_thread_t {
    uint64_t tid;
    uint64_t ccid;
    uint64_t ccw;
#ifdef DCCE_STATS
    uint64_t num_ccw_lookup_direct;
    uint64_t num_ccw_lookup_indirect;
    uint64_t ccw_lookup_time_direct;
    uint64_t ccw_lookup_time_indirect;
    uint64_t num_direct_ccw_lookup_fails;
    uint64_t num_indirect_ccw_lookup_fails;
    uint64_t stack_depth;
    uint64_t max_stack_depth;

#endif
} per_thread_t;
static int global_thread_id_max = 0;

//------------------------------------------------------
// Statistics
//------------------------------------------------------
#ifdef DCCE_STATS
static void *thread_sync_lock;
std::vector<per_thread_t*> per_thread_stats;
#endif
uint64_t read_ccw_start_time = 0;
uint64_t read_ccw_end_time = 0;


//------------------------------------------------------
// Functions for CCW
//------------------------------------------------------
void split(std::string str, std::string delimiter, std::vector<std::string> &list)
{
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

uint64_t
get_ccw_direct(uint64_t callsite, uint64_t callee, per_thread_t *pt)
{

#ifdef DCCE_STATS
    pt->num_ccw_lookup_direct++;
    pt->stack_depth++;
    if (pt->stack_depth > pt->max_stack_depth) {
        pt->max_stack_depth = pt->stack_depth;
    }
  
    struct timeval tv;
    gettimeofday(&tv, NULL);
    uint64_t lookup_time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
#endif
    //dr_fprintf(STDOUT, "get_ccw %p -> %p\n", callsite, callee);
    if (CCW_DIRECT.find(callsite) != CCW_DIRECT.end()) {
#ifdef DCCE_STATS
        gettimeofday(&tv, NULL);
        lookup_time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000) - lookup_time;
        pt->ccw_lookup_time_direct += lookup_time;
#endif
        return CCW_DIRECT[callsite];
    } else {
        //dr_fprintf(STDOUT,
        //           "\nCCW Test Failed to find ccw because unknown callsite. callsite: %p callee: %p\n",
        //           callsite, callee);
        //DR_ASSERT(false);
    }
#ifdef DCCE_STATS
    gettimeofday(&tv, NULL);
    lookup_time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000) - lookup_time;
    pt->ccw_lookup_time_direct += lookup_time;
    pt->num_direct_ccw_lookup_fails++;
#endif
    return 0; //make compiler happy
}

uint64_t
get_ccw_indirect(uint64_t callsite, uint64_t callee, per_thread_t* pt)
{
#ifdef DCCE_STATS
    pt->num_ccw_lookup_indirect++;
    pt->stack_depth++;
    if (pt->stack_depth > pt->max_stack_depth) {
        pt->max_stack_depth = pt->stack_depth;
    }
    struct timeval tv;
    gettimeofday(&tv, NULL);
    uint64_t lookup_time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
#endif
    //dr_fprintf(STDOUT, "get_ccw %p -> %p\n", callsite, callee);
    if (CCW_INDIRECT.find(callsite) != CCW_INDIRECT.end()) {
        if (CCW_INDIRECT[callsite].find(callee) != CCW_INDIRECT[callsite].end()) {
#ifdef DCCE_STATS
            gettimeofday(&tv, NULL);
            lookup_time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000) - lookup_time;
            pt->ccw_lookup_time_indirect += lookup_time;
#endif
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

#ifdef DCCE_STATS
            gettimeofday(&tv, NULL);
            lookup_time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000) - lookup_time;
            pt->ccw_lookup_time_indirect += lookup_time;
            pt->num_indirect_ccw_lookup_fails++;
#endif
    return 0; //make compiler happy
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
                g_first_call = std::strtoul(first_last[0].c_str(), NULL, 16);
                g_last_call = std::strtoul(first_last[1].c_str(), NULL, 16);
                if (first_last.size() == 3) {
                    g_barrier_call = std::strtoul(first_last[2].c_str(), NULL, 16);
                } else {
                    g_barrier_call = 0x0;
                }
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
                //uint64_t callee_addr = std::strtoul(c2w[0].c_str(), NULL, 16);
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

//------------------------------------------------------
// Callback functions at call/call_ind/return
//------------------------------------------------------
static void
at_call(app_pc instr_addr, app_pc target_addr)
{
    //if (g_prog_status == 2) return;

   
    //if (0 == g_prog_status) {
    //    if (g_first_call == (uint64_t)instr_addr) {
    //        dr_fprintf(STDOUT, "Start main function\n");
    //        g_prog_status = 1;
    //    }
    //}

    //if (g_prog_status != 1) {
    //    return;
    //}

    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);

    uint64_t ccw_value = get_ccw_direct((uint64_t)instr_addr, (uint64_t)target_addr, pt);

    // TODO: is it possible to skip updateing ccid if ccw is zero?
    //dr_fprintf(STDOUT, "at_call %p->%p (%lu--%lu-->%lu)\n", instr_addr, target_addr, pt->ccid, ccw_value, pt->ccid + ccw_value);
    pt->ccid += ccw_value;
    pt->ccw = ccw_value;
#ifdef DCCE_STATS
    //if (cs2cnt.find((uint64_t)instr_addr) == cs2cnt.end()) {
    //    cs2cnt[(uint64_t)instr_addr] = 0;
    //}
    //cs2cnt[(uint64_t)instr_addr]++;
#endif

}

static void
at_call_ind(app_pc instr_addr, app_pc target_addr)
{
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

    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);

    uint64_t ccw_value = get_ccw_indirect((uint64_t)instr_addr, (uint64_t)target_addr, pt);
    pt->ccid += ccw_value;
    pt->ccw = ccw_value;
#ifdef DCCE_STATS
    //if (cs2cnt.find((uint64_t)instr_addr) == cs2cnt.end()) {
    //    cs2cnt[(uint64_t)instr_addr] = 0;
    //}
    //cs2cnt[(uint64_t)instr_addr]++;
#endif
}

void
at_return(app_pc instr_addr, app_pc target_addr)
{
    //if (g_prog_status != 1) return;

    //if ((uint64_t)target_addr == g_last_call) {
    //    g_prog_status = 2;
    //    dr_fprintf(STDOUT, "Finished main function\n");
    //}
    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
    pt->ccid -= pt->ccw;
#ifdef DCCE_STATS
    pt->stack_depth--;
#endif
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

    InsTransEventCallback(drcontext, bb, instr);

    return DR_EMIT_DEFAULT; 
}

static void
event_thread_init(void *drcontext)
{
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
    pt->num_ccw_lookup_direct = 0;
    pt->num_ccw_lookup_indirect = 0;
    pt->ccw_lookup_time_direct = 0;
    pt->ccw_lookup_time_indirect = 0;
    pt->num_direct_ccw_lookup_fails = 0;
    pt->num_indirect_ccw_lookup_fails = 0;
    pt->stack_depth = 0;
    pt->max_stack_depth = 0;
    dr_mutex_lock(thread_sync_lock);
    per_thread_stats.push_back(pt);
    dr_mutex_unlock(thread_sync_lock);
#endif

    /* store it in the slot provided in the drcontext */
    drmgr_set_tls_field(drcontext, tls_idx, (void *)pt);
}

static void
event_thread_exit(void *drcontext)
{
    //per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
    //dr_global_free(pt, sizeof(per_thread_t));
}

DR_EXPORT
void
dccelib_init(std::string ccw_file_path, void (*pFunc)(void *, instrlist_t*, instr_t*))
{
#ifdef DCCE_STATS
    thread_sync_lock = dr_mutex_create();
#endif
    struct timeval tv;
    gettimeofday(&tv, NULL);
    read_ccw_start_time =  (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
    read_ccw_file(ccw_file_path);
    gettimeofday(&tv, NULL);
    read_ccw_end_time =  (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
    InsTransEventCallback = pFunc;
    drmgr_init();
    drmgr_register_bb_instrumentation_event(
            NULL, event_app_instruction, NULL);

    // for threads
    dr_fprintf(STDOUT, "drmgr_register_thread_init_event\n");
    drmgr_register_thread_init_event(event_thread_init);
    dr_fprintf(STDOUT, "drmgr_register_thread_exit_event\n");
    drmgr_register_thread_exit_event(event_thread_exit);
    // init drsym
    drsym_init(0);

    // thread local storage (tls)
    tls_idx = drmgr_register_tls_field();
    DR_ASSERT(tls_idx > -1);
}

DR_EXPORT
void
dccelib_exit(void)
{
    dr_fprintf(STDOUT,
               "================== BEGIN STATISTICS ==================\n");
#ifdef DCCE_STATS
    uint64_t num_ccw_lookup_direct_total = 0;
    uint64_t num_ccw_lookup_indirect_total = 0;
    uint64_t ccw_lookup_time_direct_total = 0;
    uint64_t ccw_lookup_time_indirect_total = 0;
    uint64_t num_direct_ccw_lookup_fails_total = 0;
    uint64_t num_indirect_ccw_lookup_fails_total = 0;
    uint64_t max_stack_depth = 0;

    for (unsigned long i = 0; i < per_thread_stats.size(); i++) {
      per_thread_t *pt = per_thread_stats[i];

      dr_fprintf(STDOUT,
          "================== THREAD [%d] ==================\n", pt->tid);
      dr_fprintf(STDOUT, "Direc Calls: %lu Indirect Calls: %lu Total Calls: %lu\n",
          pt->num_ccw_lookup_direct, pt->num_ccw_lookup_indirect,
          (pt->num_ccw_lookup_direct + pt->num_ccw_lookup_indirect));

      dr_fprintf(STDOUT, "CCW Lookup Direct: %lf (%ld/%ld) ms/ calls\n",
          ((double)pt->ccw_lookup_time_direct/pt->ccw_lookup_time_direct),
          pt->ccw_lookup_time_direct,pt->ccw_lookup_time_direct);

      dr_fprintf(STDOUT, "CCW Lookup Indirect: %lf (%ld/%ld) ms/ calls\n",
          ((double)pt->ccw_lookup_time_indirect/pt->num_ccw_lookup_indirect),
          pt->ccw_lookup_time_indirect, pt->num_ccw_lookup_indirect);

      dr_fprintf(STDOUT, "Maximum Stack depth: %lu\n", pt->max_stack_depth);
      dr_fprintf(STDOUT, "CCW Lookup Failes Direct: %lu\n", pt->num_direct_ccw_lookup_fails);
      dr_fprintf(STDOUT, "CCW Lookup Failes Inirect: %lu\n", pt->num_indirect_ccw_lookup_fails);

      num_ccw_lookup_direct_total += pt->num_ccw_lookup_direct;
      num_ccw_lookup_indirect_total += pt->num_ccw_lookup_indirect;
      ccw_lookup_time_direct_total += pt->ccw_lookup_time_direct;
      ccw_lookup_time_indirect_total += pt->ccw_lookup_time_indirect;
      num_direct_ccw_lookup_fails_total += pt->num_direct_ccw_lookup_fails;
      num_indirect_ccw_lookup_fails_total += pt->num_indirect_ccw_lookup_fails;
      if (max_stack_depth < pt->max_stack_depth) max_stack_depth = pt->max_stack_depth;
    }


      dr_fprintf(STDOUT, "================== TOTAL ==================\n");
      dr_fprintf(STDOUT, "[TOTAL] Direct Calls: %lu Indirect Calls: %lu, Total calls: %lu\n",
          num_ccw_lookup_direct_total, num_ccw_lookup_indirect_total,
          (num_ccw_lookup_direct_total + num_ccw_lookup_indirect_total));

    uint64_t size_ccw_direct = CCW_DIRECT.size() * sizeof(uint64_t) * 2;
    uint64_t num_cs = CCW_INDIRECT.size();
    uint64_t num_callees = 0;
    for (auto cs2clnw : CCW_INDIRECT) {
        num_callees += cs2clnw.second.size();
    }
    uint64_t size_ccw_indirect = num_cs * num_callees * sizeof(uint64_t) * 3;
    dr_fprintf(STDOUT,
               "[TOTAL] Size of CCW_DIRECT: %lu bytes (%lu * %lu * 2)\n",
               size_ccw_direct, CCW_DIRECT.size(), sizeof(uint64_t));
    dr_fprintf(STDOUT,
               "[TOTAL] Size of CCW_INDIRECT: %lu bytes (%lu * %lu * %lu * 3)\n",
               size_ccw_indirect, num_cs, num_callees, sizeof(uint64_t));
    
    dr_fprintf(STDOUT, "[TOTAL] CCW Lookup Direct: %lf (%ld/%ld) ms / calls\n",
               ((double)ccw_lookup_time_direct_total/num_ccw_lookup_direct_total),
               ccw_lookup_time_direct_total, num_ccw_lookup_direct_total);
    dr_fprintf(STDOUT, "[TOTAL] CCW Lookup indirect: %lf (%ld/%ld) ms / calls\n",
               ((double)ccw_lookup_time_indirect_total/num_ccw_lookup_indirect_total),
               ccw_lookup_time_indirect_total, num_ccw_lookup_indirect_total);
    dr_fprintf(STDOUT, "[TOTAL] CCW Lookup = %lf (%ld/%ld) ms / calls\n",
        ((double)(ccw_lookup_time_indirect_total+ccw_lookup_time_direct_total))/(num_ccw_lookup_indirect_total+num_ccw_lookup_direct_total),
        (ccw_lookup_time_indirect_total+ccw_lookup_time_direct_total), (num_ccw_lookup_indirect_total+num_ccw_lookup_direct_total));

    dr_fprintf(STDOUT, "[TOTAL] Max Stack depth: %lu\n", max_stack_depth);
    dr_fprintf(STDOUT, "[TOTAL] CCW Lookup Failes Direct: %lu\n", num_direct_ccw_lookup_fails_total);
    dr_fprintf(STDOUT, "[TOTAL] CCW Lookup Failes Inirect: %lu\n", num_indirect_ccw_lookup_fails_total);

#endif
    dr_fprintf(STDOUT, "[TOTAL] Time to read_ccw = %lu\n", read_ccw_end_time - read_ccw_start_time);

    struct rusage rusage;
    getrusage(RUSAGE_SELF, &rusage);
    dr_fprintf(STDOUT, "[TOTAL] PeakRSS = %zu\n", (size_t)rusage.ru_maxrss);

    dr_fprintf(STDOUT,
               "================== END STATISTICS ==================\n");

#ifdef DCCE_STATS
    for (unsigned long i = 0; i < per_thread_stats.size(); i++) {
      dr_global_free(per_thread_stats[i], sizeof(per_thread_t));
    }
    dr_mutex_destroy(thread_sync_lock);
#endif

    drsym_exit();
    drmgr_unregister_tls_field(tls_idx);
    drmgr_exit();
}


DR_EXPORT
uint64_t
dccelib_get_ccid()
{
    void *drcontext = dr_get_current_drcontext();
    per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext, tls_idx);
    DR_ASSERT(pt != NULL); // TODO: remove it when geeting the final result
    return pt->ccid;
}


