/* 
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

/* DrCCTProf Client Sample:
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

static droption_t<std::string> op_ccw_dir
(DROPTION_SCOPE_CLIENT, "ccwdir", "", "Directory of ccweight", "Directory of ccweight");

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
int g_prog_status = 0; // 0: Program start up, 1: Program running, 2: Program termination
std::map<std::string, std::map<uint64_t, uint64_t>> CCW;

#define MAXIMUM_SYMNAME 256
#define MAXIMUM_FILEPATH 1024
typedef struct _ccw_struct_t {
    app_pc addr;
    module_data_t* data;
    drsym_info_t sym;
    drsym_error_t symres;
    char name[MAXIMUM_SYMNAME];
    char file[MAXIMUM_FILEPATH];
} ccw_struct_t;

uint64_t
GetCCW(std::string func_name, uint64_t offset)
{
    uint64_t ccw = 0;
    if (CCW.find(func_name) != CCW.end()
        && CCW[func_name].find(offset) != CCW[func_name].end()) {
        ccw = CCW[func_name][offset];
    } else {
        dr_fprintf(STDOUT,
                   "\nCCW Test Failed: CCW not found for function: %s offset: %p\n",
                   func_name.c_str(), offset);
        //dr_close_file(gTraceFile);
        DR_ASSERT(false);
    }
    return ccw;
}

void
CreateCCWStruct(ccw_struct_t& ccw)
{
    ccw.data = dr_lookup_module(ccw.addr);
    if (ccw.data == NULL) {
        dr_fprintf(STDOUT, "[CreateCCWStruct] Data is NULL for addr %p\n", ccw.addr);
        return;
    }

    ccw.sym.struct_size = sizeof(ccw.sym);
    ccw.sym.name = ccw.name;
    ccw.sym.name_size = MAXIMUM_SYMNAME;
    ccw.sym.file = ccw.file;
    ccw.sym.file_size = MAXIMUM_FILEPATH;
    ccw.symres = drsym_lookup_address(
            ccw.data->full_path,
            ccw.addr - ccw.data->start,
            &ccw.sym,
            DRSYM_LEAVE_MANGLED); //DRSYM_DEFAULT_FLAGS);
}

void
FreeCCWStruct(ccw_struct_t& ccw)
{
    drsym_free_resources(ccw.data->full_path);
    dr_free_module_data(ccw.data);
}

void
CallBackOnCall(int32_t slot, app_pc instr_addr, app_pc target_addr)
{
    if (g_prog_status == 2) return;

    ccw_struct_t ccw;
    ccw.addr = instr_addr;
    CreateCCWStruct(ccw);

    if (ccw.data == NULL || ccw.symres != DRSYM_SUCCESS) {
        FreeCCWStruct(ccw);
        return;
    }

    if (0 == g_prog_status) {
        if (0 == strcmp(ccw.sym.name, "main")) {
            dr_fprintf(STDOUT, "Start main function\n");
            g_prog_status = 1;
        }
    }

    if (g_prog_status != 1) {
        FreeCCWStruct(ccw);
        return;
    }

    if (0 == strcmp(ccw.data->full_path, op_bin_path.get_value().c_str())) {
        uint64_t offset = instr_addr - ccw.data->start - ccw.sym.start_offs;
        std::string caller(ccw.sym.name);
        uint64_t ccw_value = GetCCW(caller, offset);
    }
    FreeCCWStruct(ccw);
}

void
CallBackOnRet(int32_t slot, app_pc instr_addr)
{
    if (g_prog_status != 1) return;

    ccw_struct_t ccw;
    ccw.addr = instr_addr;
    CreateCCWStruct(ccw);

    if (ccw.data == NULL || ccw.symres != DRSYM_SUCCESS) {
        FreeCCWStruct(ccw);
        return;
    }

    if (0 == strcmp(ccw.sym.name, "main")) {
        g_prog_status = 2;
        dr_fprintf(STDOUT, "Finished main function\n");
    }
    FreeCCWStruct(ccw);
}

void
InsTransEventCallback(void *drcontext, instr_instrument_msg_t *instrument_msg)
{
    instrlist_t *bb = instrument_msg->bb;
    instr_t *instr = instrument_msg->instr;
    int32_t slot = instrument_msg->slot;
    app_pc address = instr_get_app_pc(instr);

    if (instr_is_call_direct(instr) || instr_is_call_indirect(instr)) {
        app_pc target_addr = opnd_get_pc(instr_get_target(instr));
        dr_insert_clean_call(
                drcontext, bb, instr,
                (void *)CallBackOnCall, false,
                3, OPND_CREATE_CCT_INT(slot),
                OPND_CREATE_INTPTR(address),
                OPND_CREATE_INTPTR(target_addr));
    }

    if (instr_is_return(instr)) {
        dr_insert_clean_call(
                drcontext, bb, instr,
                (void *)CallBackOnRet, false,
                2, OPND_CREATE_CCT_INT(slot),
                OPND_CREATE_INTPTR(address));
    }
}

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
ReadCCWFile(std::string fname)
{
    dr_fprintf(STDOUT, "opening ccw file - fname %s\n", fname.c_str());
    std::ifstream ccwfile(fname.c_str());
    std::string line;
    std::string curFunc = "unknown";
    if (ccwfile.is_open()) {
        while (getline(ccwfile, line)) {
            std::vector<std::string> list;
            split(line, ":", list);
            if (list.size() == 2) {
                uint64_t offset = std::stoi(list[0]);
                uint64_t ccw = std::stoi(list[1]);
                CCW[curFunc][offset] = ccw;
            } else if (list.size() == 1) {
                curFunc = list[0];
            } else {
                dr_fprintf(STDOUT, "list is empty\n");
            }
        }
    }
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


    char name[MAXIMUM_FILEPATH] = "";
    INIT_LOG_FILE_NAME(name, op_ccw_dir.get_value().c_str(), op_bench.get_value().c_str());
    DRCCTLIB_PRINTF("Creating log file at:%s", name);

    //gTraceFile = dr_open_file(name, DR_FILE_WRITE_OVERWRITE | DR_FILE_ALLOW_LARGE);
    //DR_ASSERT(gTraceFile != INVALID_FILE);

    ReadCCWFile(op_ccw.get_value());
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

    context_handle_t max_ctxt_hndl = drcctlib_get_global_context_handle_num();
    drcctlib_exit();
    dr_fprintf(STDOUT, "max_ctxt_hndl: %lu%\n", max_ctxt_hndl);
    //dr_close_file(gTraceFile);
}

#ifdef __cplusplus
extern "C" {
#endif

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{
    dr_set_client_name("DynamoRIO Client 'ccw_test'",
                       "http://dynamorio.org/issues");

    ClientInit(argc, argv);
    dr_register_exit_event(ClientExit);
}

#ifdef __cplusplus
}
#endif
