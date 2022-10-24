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
#include "drx.h"

#include "dccelib.h"
using namespace std;

//------------------------------------------------------
// Options
//------------------------------------------------------
static droption_t<std::string> op_ccw
(DROPTION_SCOPE_CLIENT, "ccw", "", "CCWeight", "File Path of ccw");

static droption_t<std::string> op_bench
(DROPTION_SCOPE_CLIENT, "bench", "", "Benchmark", "Benchmark name");

static droption_t<std::string> op_bin_path
(DROPTION_SCOPE_CLIENT, "bin_path", "", "binary path", "binary path");

//------------------------------------------------------
// Global variables
//------------------------------------------------------
static client_id_t my_id;
uint64_t process_start_time;
uint64_t process_end_time;

static void
at_call(app_pc instr_addr, app_pc target_addr)
{
    volatile uint64_t ccid = dccelib_get_ccid();
}

static void
at_call_ind(app_pc instr_addr, app_pc target_addr)
{
    volatile uint64_t ccid = dccelib_get_ccid();
}

void InsTransEventCallback(void* drcontext, instrlist_t* bb, instr_t* instr)
{
    if (instr_is_call_direct(instr)) {
        dr_insert_call_instrumentation(drcontext, bb, instr, (app_pc)at_call);
    } else if (instr_is_call_indirect(instr)) {
        dr_insert_mbr_instrumentation(drcontext, bb, instr, (app_pc)at_call_ind,
                                      SPILL_SLOT_1);
    }

}

static void
client_init(int argc, const char *argv[])
{
    dr_fprintf(STDOUT, "Starting client dcce_ccid_overhead %d\n", my_id);
    std::string parse_err;
    int last_index;
    if (!droption_parser_t::parse_argv(DROPTION_SCOPE_CLIENT, argc, argv, &parse_err, &last_index)) {
        dr_fprintf(STDERR, "Usage error: %s\n", parse_err.c_str());
        dr_abort();
    }
    
    dccelib_init(op_ccw.get_value(), InsTransEventCallback);

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
    dccelib_exit();
}

#ifdef __cplusplus
extern "C" {
#endif

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{
    my_id = id;
    dr_set_client_name("DynamoRIO Client 'dcce_ccid_overhead'",
                       "http://dynamorio.org/issues");

    client_init(argc, argv);
    dr_register_exit_event(client_exit);
}

#ifdef __cplusplus
}
#endif
