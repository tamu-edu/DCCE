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

  void addWeightRec(uint64_t weight, uint64_t nid)
  {
  }

  void removeWeightRec(uint64_t weight, uint64_t nid)
  {
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
  std::unordered_map<uint64_t, std::unordered_set<uint64_t> > ecc; 
  uint64_t profileECC(uint64_t funcEntry/*same as nid*/)
  {
    uint64_t ccid = getCCID(funcEntry);
    pthread_mutex_lock(&lock_ecc);
#ifdef DEBUG
    printf("profileECC %lu->%lu\n", funcEntry, ccid);
#endif
    ecc[funcEntry].insert(ccid);
    pthread_mutex_unlock(&lock_ecc);
    return 0;
  }

  uint64_t barrierElider(uint64_t funcEntry/*same as nid*/)
  {
    pthread_mutex_lock(&lock_ecc);
    uint64_t ccid = getCCID(funcEntry);
    volatile uint64_t junk; // to avoid if statement below
    ccid++;
    junk ^= ~ccid;
//    pthread_mutex_lock(&lock_ecc);
//    uint64_t ccid = getCCID(funcEntry);
//    volatile uint64_t junk; // to avoid if statement below
//    if (ecc.find(funcEntry) != ecc.end() && ecc[funcEntry].find(ccid) != ecc[funcEntry].end()) {
//#ifdef DEBUG
//      printf("barrierElider funcEntry: %lu, ccid: %lu Found\n", funcEntry, ccid);
//#endif
//      junk ^= ccid;
//    } else {
//#ifdef DEBUG
//      printf("barrierElider funcEntry: %lu, ccid: %lu Not Found\n", funcEntry, ccid);
//#endif
//      junk ^= ~ccid;
//    }
    pthread_mutex_unlock(&lock_ecc);
    return 0;
  }

  void loadECC(unsigned int bench_code)
  {
    pthread_mutex_lock(&lock_ecc);
    std::string ecc_file = "/home/ksungkeun84/git/DCCE/output/static_instrument/experiment/pcce/profile_ecc/";
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
    printf("Loading ECC: %u %s\n", bench_code, ecc_file.c_str());

    std::ifstream inf(ecc_file);
    if (!inf.is_open()) {
      printf("unable to open file %s\n", ecc_file.c_str());
      exit(1);
    }

    assert(ecc.empty());
    std::string line;
    while (std::getline(inf, line)) {
      std::vector<std::string> funcEntryList;
      Split(line, funcEntryList, ':');
      assert(funcEntryList.size() == 2);
      uint64_t funcEntry = std::stol(funcEntryList[0], NULL, 10);

      std::vector<std::string> elidableList;
      Split(funcEntryList[1], elidableList, ',');

      for (int i = 0; i < elidableList.size() - 1 ; i++) {
        printf("Parsing elidable cc %s\n", elidableList[i].c_str());
        try {
          uint64_t elidable_cc = std::stol(elidableList[i], NULL, 10);
          printf("Inserting elidable cc %lu\n", elidable_cc);
          ecc[funcEntry].insert(elidable_cc);
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
    std::string ecc_file = "/home/ksungkeun84/git/DCCE/output/static_instrument/experiment/pcce/profile_ecc/";
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

    for (auto f2ECC : ecc) {
      int64_t funcEntry = f2ECC.first;
      fprintf(fptr, "%lu : ", funcEntry);
      for (auto id: f2ECC.second) {
        fprintf(fptr, "%lu,", id);
      }
      fprintf(fptr, "\n");
    }

    fclose(fptr);
    pthread_mutex_unlock(&lock_ecc);
  }
  
  std::unordered_set<uint64_t> funcAcc;
  uint64_t profileFuncAcc(uint64_t funcEntry/*same as nid*/)
  {
    pthread_mutex_lock(&lock_func_acc);
    uint64_t ccid = getCCID(funcEntry);
    ccid++;
    pthread_mutex_unlock(&lock_func_acc);
//#ifdef DEBUG
//    printf("profileFuncAcc %lu\n", ccid);
//#endif
    //funcAcc.insert(ccid);
    return 0;
  }

  void printStats(unsigned int bench_code) {
#ifdef DEBUG
    printf("------ BEGIN OF STATS -----\n");
    printf("num_ccid_updates: %lu\n", num_ccid_updates);
    printf("num_getccid: %lu\n", num_getccid);
    printf("------ END OF STATS -----\n");
#endif
  }
  void saveFuncAcc(unsigned int bench_code)
  {
    return;
  }


#ifdef __cplusplus
}
#endif
