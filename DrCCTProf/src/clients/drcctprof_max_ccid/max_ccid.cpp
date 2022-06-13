/* 
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

/* DrCCTProf Client Sample:
 * max_ccid.cpp
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

#include "dr_api.h"
#include "drcctlib.h"

#define DRCCTLIB_PRINTF(_FORMAT, _ARGS...) \
    DRCCTLIB_PRINTF_TEMPLATE("max_ccid", _FORMAT, ##_ARGS)
#define DRCCTLIB_EXIT_PROCESS(_FORMAT, _ARGS...) \
    DRCCTLIB_CLIENT_EXIT_PROCESS_TEMPLATE("max_ccid", _FORMAT, ##_ARGS)

#ifdef ARM_CCTLIB
#    define OPND_CREATE_CCT_INT OPND_CREATE_INT
#else
#    define OPND_CREATE_CCT_INT OPND_CREATE_INT32
#endif

#define MAX_CLIENT_CCT_PRINT_DEPTH 10
#define TOP_REACH_NUM_SHOW 200

static file_t gTraceFile;

using namespace std;

uint64_t process_start_time;
uint64_t process_end_time;

void
CallBackOnCall(int32_t slot, app_pc instr_addr)
{
    context_handle_t ctxt_hndl = drcctlib_get_global_context_handle_num();
    context_handle_t total_call_path = drcctlib_get_global_context_handle_num();
    dr_fprintf(gTraceFile, "Call %p - ccid: %lu max_call_path: %lu\n", instr_addr, ctxt_hndl, total_call_path);
    if (1 <= ctxt_hndl && ctxt_hndl < total_call_path) {
        drcctlib_print_backtrace(gTraceFile, ctxt_hndl, true, true, -1);
    }
}

void
CallBackOnRet(int32_t slot, app_pc instr_addr)
{
}


void
InsTransEventCallback(void *drcontext, instr_instrument_msg_t *instrument_msg)
{
    //dr_fprintf(gTraceFile, "Calling InsTransEventCallback\n");
    instrlist_t *bb = instrument_msg->bb;
    instr_t *instr = instrument_msg->instr;
    int32_t slot = instrument_msg->slot;
    app_pc address = instr_get_app_pc(instr);

    if (instr_is_call_direct(instr) || instr_is_call_indirect(instr)) {
        dr_insert_clean_call(
                drcontext, bb, instr,
                (void *)CallBackOnCall, false,
                2, OPND_CREATE_CCT_INT(slot),
                OPND_CREATE_INTPTR(address));
    }

    if (instr_is_return(instr)) {
        dr_insert_clean_call(
                drcontext, bb, instr,
                (void *)CallBackOnRet, false,
                2, OPND_CREATE_CCT_INT(slot),
                OPND_CREATE_INTPTR(address));
    }

}

static void
ClientInit(int argc, const char *argv[])
{
    char name[MAXIMUM_FILEPATH] = "";
    DRCCTLIB_INIT_LOG_FILE_NAME(name, "max_ccid", "out");
    DRCCTLIB_PRINTF("Creating log file at:%s", name);

    gTraceFile = dr_open_file(name, DR_FILE_WRITE_OVERWRITE | DR_FILE_ALLOW_LARGE);
    DR_ASSERT(gTraceFile != INVALID_FILE);

    //drcctlib_init(
    //    DRCCTLIB_FILTER_ZERO_INSTR,  // only call/ret
    //    INVALID_FILE,                // deprecated
    //    InsTransEventCallback,                        // analysis callback function
    //    false                        // do_data_centric
    //);
    drcctlib_init(DRCCTLIB_FILTER_CALL_RET_INSTR, INVALID_FILE, InsTransEventCallback, false);
    //drcctlib_init(DRCCTLIB_FILTER_ALL_INSTR, INVALID_FILE, InsTransEventCallback, false);

    struct timeval tv;
    gettimeofday(&tv, NULL);
    process_start_time =  (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
}

static void
ClientExit(void)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    process_end_time =  (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);

    uint64_t execution_time = process_end_time - process_start_time;
    dr_fprintf(gTraceFile,
               "process_start_time: %llu, process_end_time: %llu, execution_time: %llu ms\n",
               process_start_time,
               process_end_time,
               execution_time);

    context_handle_t max_ctxt_hndl = drcctlib_get_global_context_handle_num();
    dr_fprintf(gTraceFile, "max_ctxt_hndl: %lu%\n", max_ctxt_hndl);
    drcctlib_exit();
    dr_close_file(gTraceFile);
}

#ifdef __cplusplus
extern "C" {
#endif

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{
    dr_set_client_name("DynamoRIO Client 'max_ccid'",
                       "http://dynamorio.org/issues");

    ClientInit(argc, argv);
    dr_register_exit_event(ClientExit);
}

#ifdef __cplusplus
}
#endif
