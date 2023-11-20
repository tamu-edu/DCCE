#include <fstream>
#include <iostream>
#include <stdio.h>
#include <string>
#include <sstream>
#include <unordered_map>
#include <map>
#include <unordered_set>
#include <set>
#include <vector>
#include <cassert>
#include <functional>
#include <limits.h>
#include <pthread.h>
#include "../utils/utils.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MAX_THREADS (8)
  __thread uint64_t ccid;

  pthread_mutex_t lock_ecc;
  pthread_mutex_t lock_func_acc;
  pthread_mutex_t lock_stats;

#ifdef DEBUG
  uint64_t num_ccid_updates = 0;
  uint64_t num_getccid = 0;
  static FILE *fptr_barrier_log = NULL;
#endif

  void initRuntime(unsigned int bench_code) {
    if (pthread_mutex_init(&lock_stats, NULL) != 0) {
      printf("mutex init for lock_stats has failed\n");
      exit(1);
    }

    if (pthread_mutex_init(&lock_ecc, NULL) != 0) {
      printf("mutex init for lock_ecc has failed\n");
      exit(1);
    }

    if (pthread_mutex_init(&lock_func_acc, NULL) != 0) {
      printf("mutex init for lock_func_acc has failed\n");
      exit(1);
    }
  }

  void addWeight(uint64_t weight, uint64_t nid)
  {
#ifdef DEBUG
    pthread_mutex_lock(&lock_stats);
    num_ccid_updates++;
    pthread_mutex_unlock(&lock_stats);
    if (ccid > ULONG_MAX - weight) {
      printf("[tid:%lu][nid:%lu] CCID Overflow: CCID: %lu, weight: %lu\n", pthread_self(), nid, ccid, weight);
      exit(1);
    }
#endif

#ifdef VERBOSE
    printf("[tid:%lu][nid:%lu] Before callsite, %lu + %lu => %lu\n", pthread_self(), nid, ccid, weight, ccid + weight);
#endif
    ccid += weight;
  }

  void removeWeight(uint64_t weight, uint64_t nid)
  {
#ifdef DEBUG
    // ccid - weight >= 0
    if (ccid < weight) {
      printf("[tid:%lu][nid:%lu] CCID Underflow: CCID: %lu, weight: %lu\n", pthread_self(), nid, ccid, weight);
      exit(1);
    }
#endif
#ifdef VERBOSE
    printf("[tid:%lu][nid:%lu] After callsite, %lu - %lu => %lu\n", pthread_self(), nid, ccid, weight, ccid - weight);
#endif
    ccid -= weight;
  }

  std::vector<std::pair<int64_t,int64_t>> entry_stack;
  std::vector<std::pair<int64_t,int64_t>> back_stack;

  void addWeightEntry(int64_t weight, int64_t nid)
  {
    ccid += weight;
    entry_stack.push_back(std::make_pair(ccid, nid));
  }

  void removeWeightEntry(int64_t weight, int64_t nid)
  {
    ccid -= weight;
    entry_stack.pop_back();
  }

  void addWeightRec(int64_t weight, int64_t nid){
    int flag = 1;
    unsigned long top = entry_stack.size()-1;
    for(int i = top; i > 0; i--){
      if(entry_stack[i].second == nid){
        top = i;
        flag = 0;
        break;
      }
    }

    if(flag == 1){
      top = entry_stack.size()-1;
    }

    if(entry_stack[top].second == nid){ //this guy is backedge
      back_stack.push_back(std::make_pair(ccid, nid));
      ccid = entry_stack[top].first;
    }else{
      ccid += weight;
    }
  }

  void removeWeightRec(int64_t weight, int64_t nid){
    unsigned long top = entry_stack.size()-1;

    if(entry_stack[top].second == nid){
      ccid = back_stack[top].first;
      back_stack.pop_back();
    }else{
      ccid -= weight;
    }

  }


  void addWeightEB(int64_t weight, int64_t nid){
    int flag = 1;
    unsigned long top = entry_stack.size()-1;
    for(int i = top; i >= 0; i--){
      if(entry_stack[i].second == nid){
        top = i;
        flag = 0;
        break;
      }
    }

    if(flag == 1){
      top = entry_stack.size()-1;
    }
    if(entry_stack[top].second == nid){ //this guy is backedge
      back_stack.push_back(std::make_pair(ccid, nid));
      ccid = entry_stack[top].first;
    }else{
      ccid += weight;
      entry_stack.push_back(std::make_pair(ccid,nid));
    }
  }

  void removeWeightEB(int64_t weight, int64_t nid)
  {
    unsigned long top = entry_stack.size()-1;

    if(entry_stack[top].second == nid){
      ccid = back_stack[top].first;
      back_stack.pop_back();
    }else{
      ccid -= weight;
      entry_stack.pop_back();
    }
    // FIXME: 657.xz_s dead due to the assert below
    //assert(entry_stack.size() > 0);
    //unsigned long top = entry_stack.size();
    //if (top > 0) {
    //    entry_stack.pop_back();
    //}
    //printf("addWeightRec(w:%ld, nid:%ld) - top:%ld\n", weight, nid, entry_stack.size());
  }

  uint64_t getCCID(uint64_t nid)
  {
#ifdef DEBUG
    pthread_mutex_lock(&lock_stats);
    num_getccid++;
    pthread_mutex_unlock(&lock_stats);
#endif
    return ccid;
  }


  //----------------------------------------------------------------
  // Barrier Elision
  //----------------------------------------------------------------
  std::unordered_set<uint64_t> ecc; 
  uint64_t profileECC(uint64_t funcEntry/*same as nid*/)
  {
    uint64_t ccid = getCCID(funcEntry);
    pthread_mutex_lock(&lock_ecc);
#ifdef DEBUG
    printf("profileECC %lu\n", ccid);
#endif
    ecc.insert(ccid);
    pthread_mutex_unlock(&lock_ecc);
    return 0;
  }

  uint64_t barrierElider(uint64_t funcEntry/*same as nid*/)
  {
    pthread_mutex_lock(&lock_ecc);
    uint64_t ccid = getCCID(funcEntry);
    volatile uint64_t junk; // to avoid if statement below
    junk ^= ~ccid;
//    if (ecc.find(ccid) != ecc.end()) {
//#ifdef DEBUG
//      printf("barrierElider ccid: %lu Found\n", ccid);
//      fprintf(fptr_barrier_log, "%lu,1\n", ccid);
//#endif
//      junk ^= ccid;
//    } else {
//#ifdef DEBUG
//      printf("barrierElider ccid: %lu Not Found\n", ccid);
//      fprintf(fptr_barrier_log, "%lu,0\n", ccid);
//#endif
//      junk ^= ~ccid;
//    }
    pthread_mutex_unlock(&lock_ecc);
    return 0;
  }

  void loadECC(unsigned int bench_code)
  {
    pthread_mutex_lock(&lock_ecc);
    std::string ecc_file = "/home/ksungkeun84/git/DCCE/output/static_instrument/experiment/dcce/profile_ecc/";
#ifdef DEBUG
    std::string barrier_log_file;
#endif
    switch (bench_code) {
      case 100: ecc_file += "/test/100.test-pcce-fig-4"; break;
      case 101: ecc_file += "/test/101.test-pcce-fig-5a"; break;
      case 102: ecc_file += "/test/102.test-indirect-call"; break;
      case 103: ecc_file += "/test/103.test-libc-nostatic-nodebug"; break;
                //case 103: ecc_file += "/test/103.test-libc-static-nodebug"; break;
                //case 103: ecc_file += "/test/103.test-libc-static-debug"; break;
      case 104: ecc_file += "/test/104.test-backedge"; break;
      case 105: ecc_file += "/test/105.test-functionname"; break;
      case 106: ecc_file += "/test/106.test-machinecode"; break;
      case 108: ecc_file += "/test/108.test-mleak"; break;
      case 109: ecc_file += "/test/109.test-matadd"; break;
      case 110: ecc_file += "/test/110.test-tail-call"; break;
      case 111: ecc_file += "/test/111.barrier-elision"; break;

      case 505: ecc_file += "/SPEC2017/505.mcf_r"; break;
      case 508: ecc_file += "/SPEC2017/508.namd_r"; break;
      case 510: ecc_file += "/SPEC2017/510.parest_r"; break;
      case 519: ecc_file += "/SPEC2017/519.lbm_r"; break;
      case 523: ecc_file += "/SPEC2017/523.xalancbmk_r"; break;
      case 525: ecc_file += "/SPEC2017/525.x264_r"; break;
      case 541: ecc_file += "/SPEC2017/541.leela_r"; break;
      case 557: ecc_file += "/SPEC2017/557.xz_r"; break;
      case 605: ecc_file += "/SPEC2017/605.mcf_s"; break;
      case 619: ecc_file += "/SPEC2017/619.lbm_s"; break;
      case 623: ecc_file += "/SPEC2017/623.xalancbmk_s"; break;
      case 625: ecc_file += "/SPEC2017/625.x264_s"; break;
      case 641: ecc_file += "/SPEC2017/641.leela_s"; break;
      case 657: ecc_file += "/SPEC2017/657.xz_s"; break;

      case 701: ecc_file += "/Splash-3/701.BARNES"; break;
      case 702: ecc_file += "/Splash-3/702.CHOLESKY"; break;
      case 703: ecc_file += "/Splash-3/703.FFT"; break;
      case 704: ecc_file += "/Splash-3/704.FMM"; break;
      case 705: ecc_file += "/Splash-3/705.LU-CB"; break;
      case 706: ecc_file += "/Splash-3/706.LU-NCB"; break;
      case 707: ecc_file += "/Splash-3/707.OCEAN-CP"; break;
      case 708: ecc_file += "/Splash-3/708.OCEAN-NCP"; break;
      case 709: ecc_file += "/Splash-3/709.RADIOSITY"; break;
      case 710: ecc_file += "/Splash-3/710.RADIX"; break;
      case 711: ecc_file += "/Splash-3/711.RAYTRACE"; break;
      case 712: ecc_file += "/Splash-3/712.VOLREND"; break;
      case 713: ecc_file += "/Splash-3/713.WATER-NSQUARED"; break;
      case 714: ecc_file += "/Splash-3/714.WATER-SPATIAL"; break;
      
      case 802: ecc_file += "/extra/802.lud"; break;
    }

#ifdef DEBUG
    barrier_log_file = ecc_file;
    barrier_log_file += ".barrier_log";
    fptr_barrier_log = fopen(barrier_log_file.c_str(), "w");
    if (fptr_barrier_log == NULL) {
      printf("Error: failed to open barrier log file %s\n", barrier_log_file.c_str());
    }
#endif
    ecc_file += ".ecc";
    printf("Loading ECC: %u %s\n", bench_code, ecc_file.c_str());

    std::ifstream inf(ecc_file);
    if (!inf.is_open()) {
      printf("unable to open file %s\n", ecc_file.c_str());
      exit(1);
    }

    assert(ecc.empty());
    std::string line;
    while (std::getline(inf, line)) {
      std::vector<std::string> elidableList;
      Split(line, elidableList, ',');

      for (int i = 0; i < elidableList.size() - 1; i++) {
        printf("Parsing elidable cc %s\n", elidableList[i].c_str());
        try {
          uint64_t elidable_cc = std::stol(elidableList[i], NULL, 10);
          printf("Inserting elidable cc %lu\n", elidable_cc);
          ecc.insert(elidable_cc);
        } catch (const std::out_of_range& oor) {
          printf("elidable cc out of range!!!\n");
          exit(1);
        }
      }
    }

    inf.close();
    pthread_mutex_unlock(&lock_ecc);
  }

  void saveECC(unsigned int bench_code)
  {
    pthread_mutex_lock(&lock_ecc);
    std::string ecc_file = "/home/ksungkeun84/git/DCCE/output/static_instrument/experiment/dcce/profile_ecc";
    switch (bench_code) {
      case 100: ecc_file += "/test/100.test-pcce-fig-4"; break;
      case 101: ecc_file += "/test/101.test-pcce-fig-5a"; break;
      case 102: ecc_file += "/test/102.test-indirect-call"; break;
      case 103: ecc_file += "/test/103.test-libc-nostatic-nodebug"; break;
                //case 103: ecc_file += "/test/103.test-libc-static-nodebug"; break;
                //case 103: ecc_file += "/test/103.test-libc-static-debug"; break;
      case 104: ecc_file += "/test/104.test-backedge"; break;
      case 105: ecc_file += "/test/105.test-functionname"; break;
      case 106: ecc_file += "/test/106.test-machinecode"; break;
      case 108: ecc_file += "/test/108.test-mleak"; break;
      case 109: ecc_file += "/test/109.test-matadd"; break;
      case 110: ecc_file += "/test/110.test-tail-call"; break;
      case 111: ecc_file += "/test/111.barrier-elision"; break;

      case 505: ecc_file += "/SPEC2017/505.mcf_r"; break;
      case 508: ecc_file += "/SPEC2017/508.namd_r"; break;
      case 510: ecc_file += "/SPEC2017/510.parest_r"; break;
      case 519: ecc_file += "/SPEC2017/519.lbm_r"; break;
      case 523: ecc_file += "/SPEC2017/523.xalancbmk_r"; break;
      case 525: ecc_file += "/SPEC2017/525.x264_r"; break;
      case 541: ecc_file += "/SPEC2017/541.leela_r"; break;
      case 557: ecc_file += "/SPEC2017/557.xz_r"; break;
      case 605: ecc_file += "/SPEC2017/605.mcf_s"; break;
      case 619: ecc_file += "/SPEC2017/619.lbm_s"; break;
      case 623: ecc_file += "/SPEC2017/623.xalancbmk_s"; break;
      case 625: ecc_file += "/SPEC2017/625.x264_s"; break;
      case 641: ecc_file += "/SPEC2017/641.leela_s"; break;
      case 657: ecc_file += "/SPEC2017/657.xz_s"; break;

      case 701: ecc_file += "/Splash-3/701.BARNES"; break;
      case 702: ecc_file += "/Splash-3/702.CHOLESKY"; break;
      case 703: ecc_file += "/Splash-3/703.FFT"; break;
      case 704: ecc_file += "/Splash-3/704.FMM"; break;
      case 705: ecc_file += "/Splash-3/705.LU-CB"; break;
      case 706: ecc_file += "/Splash-3/706.LU-NCB"; break;
      case 707: ecc_file += "/Splash-3/707.OCEAN-CP"; break;
      case 708: ecc_file += "/Splash-3/708.OCEAN-NCP"; break;
      case 709: ecc_file += "/Splash-3/709.RADIOSITY"; break;
      case 710: ecc_file += "/Splash-3/710.RADIX"; break;
      case 711: ecc_file += "/Splash-3/711.RAYTRACE"; break;
      case 712: ecc_file += "/Splash-3/712.VOLREND"; break;
      case 713: ecc_file += "/Splash-3/713.WATER-NSQUARED"; break;
      case 714: ecc_file += "/Splash-3/714.WATER-SPATIAL"; break;
      
      case 802: ecc_file += "/extra/802.lud"; break;
    }

    ecc_file += ".ecc";
    printf("saveECC %u to %s\n", bench_code, ecc_file.c_str());
    FILE *fptr = fopen(ecc_file.c_str(), "w");
    if (fptr == NULL) {
      printf("Error: failed to open ecc file %s\n", ecc_file.c_str());
      exit(1);
    }

    for (auto id : ecc) {
      fprintf(fptr, "%lu,", id);
    }
    fprintf(fptr, "\n");

    fclose(fptr);
    pthread_mutex_unlock(&lock_ecc);
  }


  std::unordered_set<uint64_t> funcAcc;
  uint64_t profileFuncAcc(uint64_t funcEntry/*same as nid*/)
  {
    pthread_mutex_lock(&lock_func_acc);
    uint64_t ccid = getCCID(funcEntry);
    pthread_mutex_unlock(&lock_func_acc);
//#ifdef DEBUG
//    printf("profileFuncAcc %lu\n", ccid);
//#endif
    //funcAcc.insert(ccid);
    return 0;
  }

  void saveFuncAcc(unsigned int bench_code)
  {
    return;
    pthread_mutex_lock(&lock_func_acc);
    std::string func_acc_file = "/home/ksungkeun84/git/DCCE/output/static_instrument/experiment/dcce/profile_func_acc";
    switch (bench_code) {
      case 100: func_acc_file += "/test/100.test-pcce-fig-4"; break;
      case 101: func_acc_file += "/test/101.test-pcce-fig-5a"; break;
      case 102: func_acc_file += "/test/102.test-indirect-call"; break;
      case 103: func_acc_file += "/test/103.test-libc-nostatic-nodebug"; break;
    //case 103: func_acc_file += "/test/103.test-libc-static-nodebug"; break;
    //case 103: func_acc_file += "/test/103.test-libc-static-debug"; break;
      case 104: func_acc_file += "/test/104.test-backedge"; break;
      case 105: func_acc_file += "/test/105.test-functionname"; break;
      case 106: func_acc_file += "/test/106.test-machinecode"; break;
      case 108: func_acc_file += "/test/108.test-mleak"; break;
      case 109: func_acc_file += "/test/109.test-matadd"; break;
      case 110: func_acc_file += "/test/110.test-tail-call"; break;
      case 111: func_acc_file += "/test/111.barrier-elision"; break;

      case 505: func_acc_file += "/SPEC2017/505.mcf_r"; break;
      case 508: func_acc_file += "/SPEC2017/508.namd_r"; break;
      case 510: func_acc_file += "/SPEC2017/510.parest_r"; break;
      case 519: func_acc_file += "/SPEC2017/519.lbm_r"; break;
      case 523: func_acc_file += "/SPEC2017/523.xalancbmk_r"; break;
      case 525: func_acc_file += "/SPEC2017/525.x264_r"; break;
      case 541: func_acc_file += "/SPEC2017/541.leela_r"; break;
      case 557: func_acc_file += "/SPEC2017/557.xz_r"; break;
      case 605: func_acc_file += "/SPEC2017/605.mcf_s"; break;
      case 619: func_acc_file += "/SPEC2017/619.lbm_s"; break;
      case 623: func_acc_file += "/SPEC2017/623.xalancbmk_s"; break;
      case 625: func_acc_file += "/SPEC2017/625.x264_s"; break;
      case 641: func_acc_file += "/SPEC2017/641.leela_s"; break;
      case 657: func_acc_file += "/SPEC2017/657.xz_s"; break;

      case 701: func_acc_file += "/Splash-3/701.BARNES"; break;
      case 702: func_acc_file += "/Splash-3/702.CHOLESKY"; break;
      case 703: func_acc_file += "/Splash-3/703.FFT"; break;
      case 704: func_acc_file += "/Splash-3/704.FMM"; break;
      case 705: func_acc_file += "/Splash-3/705.LU-CB"; break;
      case 706: func_acc_file += "/Splash-3/706.LU-NCB"; break;
      case 707: func_acc_file += "/Splash-3/707.OCEAN-CP"; break;
      case 708: func_acc_file += "/Splash-3/708.OCEAN-NCP"; break;
      case 709: func_acc_file += "/Splash-3/709.RADIOSITY"; break;
      case 710: func_acc_file += "/Splash-3/710.RADIX"; break;
      case 711: func_acc_file += "/Splash-3/711.RAYTRACE"; break;
      case 712: func_acc_file += "/Splash-3/712.VOLREND"; break;
      case 713: func_acc_file += "/Splash-3/713.WATER-NSQUARED"; break;
      case 714: func_acc_file += "/Splash-3/714.WATER-SPATIAL"; break;
      
      case 802: func_acc_file += "/extra/802.lud"; break;
    }

    func_acc_file += ".func_acc";
    printf("saveFuncAcc %u to %s\n", bench_code, func_acc_file.c_str());
    FILE *fptr = fopen(func_acc_file.c_str(), "w");
    if (fptr == NULL) {
      printf("Error: failed to open func_acc file %s\n", func_acc_file.c_str());
      exit(1);
    }

    for (auto id : funcAcc) {
      fprintf(fptr, "%lu,", id);
    }
    fprintf(fptr, "\n");

    fclose(fptr);
    pthread_mutex_unlock(&lock_func_acc);
  }
  void printStats(unsigned int bench_code) {
#ifdef DEBUG
    printf("------ BEGIN OF STATS -----\n");
    printf("num_ccid_updates: %lu\n", num_ccid_updates);
    printf("num_getccid: %lu\n", num_getccid);
    printf("------ END OF STATS -----\n");
    if (fptr_barrier_log != NULL) {
      fclose(fptr_barrier_log);
    }
#endif
  }

#ifdef __cplusplus
}

#endif
