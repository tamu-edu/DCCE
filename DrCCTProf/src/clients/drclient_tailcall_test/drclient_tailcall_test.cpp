/* 
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

/* DrCCTProf Client Sample:
 * drclient_tailcall_test.cpp
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
#include <map>
#include <sys/time.h>
#include <fstream>
#include <string>
#include <unistd.h>

#include "dr_api.h"
#include "dr_events.h"
#include "droption.h"
#include "drsyms.h"
#include "drmgr.h"
#include "drwrap.h"
#include "drx.h"
using namespace std;

//------------------------------------------------------
// Options
//------------------------------------------------------
static droption_t<std::string> op_bench
(DROPTION_SCOPE_CLIENT, "bench", "", "Benchmark", "Benchmark name");

//------------------------------------------------------
// Global variables
//------------------------------------------------------
static int tls_idx;
static client_id_t my_id;

uint64_t process_start_time;
uint64_t process_end_time;


//------------------------------------------------------
// Callback functions at call/call_ind/return
//------------------------------------------------------
static void
at_call(app_pc instr_addr, app_pc target_addr)
{
    dr_fprintf(STDOUT, "at_call %p %p\n", instr_addr, target_addr);
}

static void
at_call_ind(app_pc instr_addr, app_pc target_addr)
{
    dr_fprintf(STDOUT, "at_call_ind %p %p\n", instr_addr, target_addr);
}

void
at_return(app_pc instr_addr, app_pc target_addr)
{
    dr_fprintf(STDOUT, "at_return %p %p\n", instr_addr, target_addr);
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
    dr_fprintf(STDOUT, "event_thread_init tls_idx: %d\n", tls_idx);
}

static void
event_thread_exit(void *drcontext)
{
    dr_fprintf(STDOUT, "event_thread_exit tls_idx: %d\n", tls_idx);
}

static void
client_init(int argc, const char *argv[])
{
    dr_fprintf(STDOUT, "Starting client %s\n", my_id);
    std::string parse_err;
    int last_index;
    if (!droption_parser_t::parse_argv(DROPTION_SCOPE_CLIENT, argc, argv, &parse_err, &last_index)) {
        dr_fprintf(STDERR, "Usage error: %s\n", parse_err.c_str());
        dr_abort();
    }

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
               "process_start_time: %llu, process_end_time: %llu, execution_time: %llu ms\n",
               process_start_time,
               process_end_time,
               execution_time);

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
    dr_set_client_name("DynamoRIO Client 'drclient_tailcall_test'",
                       "http://dynamorio.org/issues");

    client_init(argc, argv);
    dr_register_exit_event(client_exit);
}

#ifdef __cplusplus
}
#endif
