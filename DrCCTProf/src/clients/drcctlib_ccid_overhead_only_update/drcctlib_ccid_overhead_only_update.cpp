/* 
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

/* DrCCTProf Client Sample:
 * drcctlib_ccid_overhead_only_update.cpp
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
#include <map>
#include <sys/time.h>
#include <fstream>
#include <string>

#include "dr_api.h"
#include "drcctlib.h"
#include "droption.h"
#include "drsyms.h"
#include "drwrap.h"
using namespace std;

#define INIT_LOG_FILE_NAME(_BUFFER, _CCW_DIR, _BENCH)                       \
    do {                                                                             \
        sprintf(_BUFFER + strlen(_BUFFER), "%s/ccwtest-%s-%d.log", _CCW_DIR, _BENCH, getpid()); \
    } while (0)

static droption_t<std::string> op_ccw
(DROPTION_SCOPE_CLIENT, "ccw", "", "CCWeight", "File Path of ccw");

static droption_t<std::string> op_bench
(DROPTION_SCOPE_CLIENT, "bench", "", "Benchmark", "Benchmark name");

static droption_t<std::string> op_bin_path
(DROPTION_SCOPE_CLIENT, "bin_path", "", "binary path", "binary path");

#define DRCCTLIB_PRINTF(_FORMAT, _ARGS...) \
    DRCCTLIB_PRINTF_TEMPLATE("ccw_test", _FORMAT, ##_ARGS)
#define DRCCTLIB_EXIT_PROCESS(_FORMAT, _ARGS...) \
    DRCCTLIB_CLIENT_EXIT_PROCESS_TEMPLATE("ccw_test", _FORMAT, ##_ARGS)

#ifdef ARM_CCTLIB
#    define OPND_CREATE_CCT_INT OPND_CREATE_INT
#else
#    define OPND_CREATE_CCT_INT OPND_CREATE_INT32
#endif

//static file_t gTraceFile;
uint64_t process_start_time;
uint64_t process_end_time;

//------------------------------------------------------
// Statistics
//------------------------------------------------------
//std::unordered_map<uint64_t, uint64_t> cs2cnt;
//std::unordered_map<uint64_t, uint64_t> barrier2cnt;

void
InsTransEventCallback(void *drcontext, instr_instrument_msg_t *instrument_msg)
{
}

static void
ClientInit(int argc, const char *argv[])
{
    std::string parse_err;
    int last_index;
    if (!droption_parser_t::parse_argv(DROPTION_SCOPE_CLIENT, argc, argv, &parse_err, &last_index)) {
        dr_fprintf(STDERR, "Usage error: %s", parse_err.c_str());
        dr_abort();
    }


    //char name[MAXIMUM_FILEPATH] = "";
    //INIT_LOG_FILE_NAME(name, op_ccw_dir.get_value().c_str(), op_bench.get_value().c_str());
    //DRCCTLIB_PRINTF("Creating log file at:%s", name);
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
    dr_fprintf(STDOUT,
               "process_start_time: %llu, process_end_time: %llu, execution_time: %llu ms\n",
               process_start_time,
               process_end_time,
               execution_time);

    // stats about max_ctxt and memory usage will be printed by drcctlib_exit() -> print_stats()
    //context_handle_t max_ctxt_hndl = drcctlib_get_global_context_handle_num();
    //dr_fprintf(STDOUT, "max_ctxt_hndl: %lu%\n", max_ctxt_hndl);

    //dr_fprintf(STDOUT, "-------------------------\n");
    //dr_fprintf(STDOUT, "callsite | counts\n");
    //dr_fprintf(STDOUT, "-------------------------\n");
    //for (auto item : cs2cnt) {
    //    dr_fprintf(STDOUT, "%p,%lu\n", item.first, item.second);
    //}
    drcctlib_exit();
    //dr_close_file(gTraceFile);
}

#ifdef __cplusplus
extern "C" {
#endif

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{
    dr_set_client_name("DynamoRIO Client 'drcctlib_ccid_overhead_only_update'",
                       "http://dynamorio.org/issues");

    ClientInit(argc, argv);
    dr_register_exit_event(ClientExit);
}

#ifdef __cplusplus
}
#endif
