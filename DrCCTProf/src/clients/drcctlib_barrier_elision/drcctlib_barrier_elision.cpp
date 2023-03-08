#include <iterator>
#include <vector>
#include <unordered_map>
#include <sys/resource.h>
#include <map>
#include <sys/time.h>
#include <fstream>
#include <string>
#include <unistd.h>

#include "dr_api.h"
#include "dr_events.h"
#include "droption.h"
#include "drsyms.h"
#include "drwrap.h"
#include "drmgr.h"
#include "drx.h"

#include "drcctlib.h"
using namespace std;

static int tls_idx;

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

//------------------------------------------------------
// Thread Local Storage
//------------------------------------------------------
#define ATOMIC_ADD_THREAD_ID_MAX(origin) dr_atomic_add32_return_sum(&origin, 1)
#define THREAD_MAX_NUM 8192
typedef struct _per_thread_t {
  uint64_t tid;
#ifdef BARRIER_STATS
  uint64_t num_barrier_calls;
  uint64_t time_barrier_calls;
#endif
} per_thread_t;
static int global_thread_id_max = 0;

#ifdef BARRIER_STATS
static void *thread_sync_lock;
static std::vector<per_thread_t*> per_thread_stats;
#endif

bool isBarrierCall(app_pc addr)
{
#define MAXIMUM_SYMNAME 256
#define MAXIMUM_FILEPATH 1024
  module_data_t *data = NULL;
  data = dr_lookup_module(addr);
  if (data == NULL) {
    return false;
  }

  drsym_error_t symres;
  drsym_info_t sym;
  char name[MAXIMUM_SYMNAME];
  char file[MAXIMUM_FILEPATH];

  sym.struct_size = sizeof(sym);
  sym.name = name;
  sym.name_size = MAXIMUM_SYMNAME;
  sym.file = file;
  sym.file_size = MAXIMUM_FILEPATH;
  symres = drsym_lookup_address(
      data->full_path, addr - data->start, &sym,
      DRSYM_LEAVE_MANGLED);

  if (symres == DRSYM_SUCCESS && strstr(sym.name, "sk_barrier") != NULL) {
    dr_free_module_data(data);
    return true;
  }

  dr_free_module_data(data);
  return false;
}

void
CallBackOnBarrier(int32_t slot, app_pc instr_addr, app_pc target_addr)
{
#ifdef BARRIER_STATS
  void *drcontext_ = dr_get_current_drcontext();
  per_thread_t *pt = (per_thread_t *)drmgr_get_tls_field(drcontext_, tls_idx);
  pt->num_barrier_calls++;

  struct timeval tv;
  gettimeofday(&tv, NULL);
  uint64_t time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000);
#endif

  void *drcontext = dr_get_current_drcontext();
  context_handle_t ctxt_hndl = drcctlib_get_context_handle(drcontext, slot);
  drcctlib_get_full_cct(ctxt_hndl);

#ifdef BARRIER_STATS
  gettimeofday(&tv, NULL);
  time = (tv.tv_sec * (uint64_t)1000) + (tv.tv_usec / 1000) - time;
  pt->time_barrier_calls += time;
#endif
}

  void
InsTransEventCallback(void *drcontext, instr_instrument_msg_t *instrument_msg)
{
#ifdef ARM_CCTLIB
#    define OPND_CREATE_CCT_INT OPND_CREATE_INT
#else
#    define OPND_CREATE_CCT_INT OPND_CREATE_INT32
#endif
  instrlist_t *bb = instrument_msg->bb;
  instr_t *instr = instrument_msg->instr;
  int32_t slot = instrument_msg->slot;
  app_pc address = instr_get_app_pc(instr);

  if (instr_is_call_direct(instr) || instr_is_call_indirect(instr)) {
    app_pc target_addr = opnd_get_pc(instr_get_target(instr));
    if (isBarrierCall(target_addr)) {
      dr_insert_clean_call(
          drcontext, bb, instr,
          (void *)CallBackOnBarrier, false,
          3, OPND_CREATE_CCT_INT(slot),
          OPND_CREATE_INTPTR(address),
          OPND_CREATE_INTPTR(target_addr));
    }
  }
}

  static void
EventThreadInit(void *drcontext)
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
  pt->tid = id;
#ifdef BARRIER_STATS
  pt->num_barrier_calls = 0;
  pt->time_barrier_calls = 0;
  dr_mutex_lock(thread_sync_lock);
  per_thread_stats.push_back(pt);
  dr_mutex_unlock(thread_sync_lock);
#endif

  /* store it in the slot provided in the drcontext */
  drmgr_set_tls_field(drcontext, tls_idx, (void *)pt);
}

  static void
EventThreadExit(void *drcontext)
{
}

  static void
ClientInit(int argc, const char *argv[])
{
  dr_fprintf(STDOUT, "Starting client drcctlib_barrier_elision %d\n", my_id);
  if (!drmgr_init()) {
    dr_fprintf(STDOUT,
        "ERROR: unable to initialize drmgr");
    exit(1);
  }
#ifdef BARRIER_STATS
    thread_sync_lock = dr_mutex_create();
#endif

  std::string parse_err;
  int last_index;
  if (!droption_parser_t::parse_argv(DROPTION_SCOPE_CLIENT, argc, argv, &parse_err, &last_index)) {
    dr_fprintf(STDERR, "Usage error: %s\n", parse_err.c_str());
    dr_abort();
  }

  drmgr_priority_t thread_init_pri = { sizeof(thread_init_pri),
    "drcctlib_barrier_thread_init", NULL, NULL,
    DRCCTLIB_THREAD_EVENT_PRI + 1 };
  drmgr_priority_t thread_exit_pri = { sizeof(thread_exit_pri),
    "drcctlib_barrier_thread_exit", NULL, NULL,
    DRCCTLIB_THREAD_EVENT_PRI + 1 };
  drmgr_register_thread_init_event_ex(EventThreadInit, &thread_init_pri);
  drmgr_register_thread_exit_event_ex(EventThreadExit, &thread_exit_pri);
  tls_idx = drmgr_register_tls_field();

  drcctlib_init(DRCCTLIB_FILTER_CALL_RET_INSTR, INVALID_FILE, InsTransEventCallback, false);

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
#ifdef BARRIER_STATS
  dr_fprintf(STDOUT, "================ BEGIN BARRIER STATISTICS ==============\n");
  uint64_t total_num_barrier_calls = 0;
  uint64_t total_time_barrier_calls = 0;
  for (unsigned long i = 0; i < per_thread_stats.size(); i++) {
    per_thread_t *pt = per_thread_stats[i];
    total_num_barrier_calls += pt->num_barrier_calls;
    total_time_barrier_calls += pt->time_barrier_calls;
  }

  dr_fprintf(STDOUT, "Total Number of Barrier Calls: %lu\n", total_num_barrier_calls);
  dr_fprintf(STDOUT, "Total Time of Barrier Calls: %lu\n", total_time_barrier_calls);
  dr_fprintf(STDOUT, "Overhead per Barrier Calls (ms/call): %lf\n", (double)total_num_barrier_calls/total_time_barrier_calls);

  dr_fprintf(STDOUT, "================ END BARRIER STATISTICS ==============\n");
#endif

#ifdef BARRIER_STATS
  for (unsigned long i = 0; i < per_thread_stats.size(); i++) {
    dr_global_free(per_thread_stats[i], sizeof(per_thread_t));
  }
  dr_mutex_destroy(thread_sync_lock);
#endif

  drmgr_unregister_thread_init_event(EventThreadInit);
  drmgr_unregister_thread_exit_event(EventThreadExit);
  drmgr_unregister_tls_field(tls_idx);

  drcctlib_exit();
    
  if (!drmgr_unregister_thread_init_event(EventThreadInit) ||
      !drmgr_unregister_thread_exit_event(EventThreadExit) ||
      !drmgr_unregister_tls_field(tls_idx)) {
    dr_fprintf(STDOUT,
        "ERROR: drcctlib_trace failed to unregister in ClientExit");
  }
}

#ifdef __cplusplus
extern "C" {
#endif

  DR_EXPORT void
    dr_client_main(client_id_t id, int argc, const char *argv[])
    {
      my_id = id;
      dr_set_client_name("DynamoRIO Client 'drcctlib_barrier_elision'",
          "http://dynamorio.org/issues");

      ClientInit(argc, argv);
      dr_register_exit_event(ClientExit);
    }

#ifdef __cplusplus
}
#endif
