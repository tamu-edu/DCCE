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
#include <boost/functional/hash.hpp>
#include "../utils/utils.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MAX_THREADS (8)
  __thread uint64_t ccid;

  pthread_mutex_t lock_profile;
  pthread_mutex_t lock_stats;

  std::unordered_set<uint64_t> visited;

#ifdef DEBUG
  uint64_t num_ccid_updates = 0;
  uint64_t num_getccid = 0;
#endif

  void initRuntime(unsigned int bench_code) {
    if (pthread_mutex_init(&lock_stats, NULL) != 0) {
      printf("mutex init for lock_stats has failed\n");
      exit(1);
    }

    if (pthread_mutex_init(&lock_profile, NULL) != 0) {
      printf("mutex init for lock_profile has failed\n");
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
    addWeight(weight, nid);
  }

  void removeWeightRec(uint64_t weight, uint64_t nid)
  {
    removeWeight(weight, nid);
  }

  uint64_t getCCID(uint64_t nid)
  {
#ifdef DEBUG
    pthread_mutex_lock(&lock_stats);
    num_getccid++;
    pthread_mutex_unlock(&lock_stats);
#endif
    size_t hash = 0;
    boost::hash_combine(hash, nid);
    boost::hash_combine(hash, ccid);
    return hash;
  }

  uint64_t profile(uint64_t nid)
  {
#ifdef DEBUG
    pthread_mutex_lock(&lock_stats);
    num_getccid++;
    pthread_mutex_unlock(&lock_stats);
#endif
    size_t hash = 0;
    boost::hash_combine(hash, nid);
    boost::hash_combine(hash, ccid);
    pthread_mutex_lock(&lock_profile);
    visited.insert(hash);
    pthread_mutex_unlock(&lock_profile);
    return hash;
  }

  void printStats(unsigned int bench_code) {
#ifdef DEBUG
    printf("------ BEGIN OF STATS -----\n");
    printf("num_ccid_updates: %lu\n", num_ccid_updates);
    printf("num_getccid: %lu\n", num_getccid);
    printf("------ END OF STATS -----\n");
#endif
  }

  void saveProfile(unsigned int bench_code)
  {
    pthread_mutex_lock(&lock_profile);
    std::string profile_file = "output/static_instrument/experiment/pcce/profile";
    switch (bench_code) {
      case 100: profile_file += "/test/100.test-pcce-fig-4"; break;
      case 101: profile_file += "/test/101.test-pcce-fig-5a"; break;
      case 102: profile_file += "/test/102.test-indirect-call"; break;
      case 103: profile_file += "/test/103.test-libc-nostatic-nodebug"; break;
    //case 103: profile_file += "/test/103.test-libc-static-nodebug"; break;
    //case 103: profile_file += "/test/103.test-libc-static-debug"; break;
      case 104: profile_file += "/test/104.test-backedge"; break;
      case 105: profile_file += "/test/105.test-functionname"; break;
      case 106: profile_file += "/test/106.test-machinecode"; break;
      case 108: profile_file += "/test/108.test-mleak"; break;
      case 109: profile_file += "/test/109.test-matadd"; break;
      case 110: profile_file += "/test/110.test-tail-call"; break;
      case 111: profile_file += "/test/111.barrier-elision"; break;

      case 505: profile_file += "/SPEC2017/505.mcf_r"; break;
      case 508: profile_file += "/SPEC2017/508.namd_r"; break;
      case 510: profile_file += "/SPEC2017/510.parest_r"; break;
      case 519: profile_file += "/SPEC2017/519.lbm_r"; break;
      case 523: profile_file += "/SPEC2017/523.xalancbmk_r"; break;
      case 525: profile_file += "/SPEC2017/525.x264_r"; break;
      case 541: profile_file += "/SPEC2017/541.leela_r"; break;
      case 557: profile_file += "/SPEC2017/557.xz_r"; break;
      case 605: profile_file += "/SPEC2017/605.mcf_s"; break;
      case 619: profile_file += "/SPEC2017/619.lbm_s"; break;
      case 623: profile_file += "/SPEC2017/623.xalancbmk_s"; break;
      case 625: profile_file += "/SPEC2017/625.x264_s"; break;
      case 641: profile_file += "/SPEC2017/641.leela_s"; break;
      case 657: profile_file += "/SPEC2017/657.xz_s"; break;

      case 701: profile_file += "/Splash-3/701.BARNES"; break;
      case 702: profile_file += "/Splash-3/702.CHOLESKY"; break;
      case 703: profile_file += "/Splash-3/703.FFT"; break;
      case 704: profile_file += "/Splash-3/704.FMM"; break;
      case 705: profile_file += "/Splash-3/705.LU-CB"; break;
      case 706: profile_file += "/Splash-3/706.LU-NCB"; break;
      case 707: profile_file += "/Splash-3/707.OCEAN-CP"; break;
      case 708: profile_file += "/Splash-3/708.OCEAN-NCP"; break;
      case 709: profile_file += "/Splash-3/709.RADIOSITY"; break;
      case 710: profile_file += "/Splash-3/710.RADIX"; break;
      case 711: profile_file += "/Splash-3/711.RAYTRACE"; break;
      case 712: profile_file += "/Splash-3/712.VOLREND"; break;
      case 713: profile_file += "/Splash-3/713.WATER-NSQUARED"; break;
      case 714: profile_file += "/Splash-3/714.WATER-SPATIAL"; break;
      
      case 802: profile_file += "/extra/802.lud"; break;
    }

    profile_file += ".func_acc";
    printf("saveFuncAcc %u to %s\n", bench_code, profile_file.c_str());
    FILE *fptr = fopen(profile_file.c_str(), "w");
    if (fptr == NULL) {
      printf("Error: failed to open func_acc file %s\n", profile_file.c_str());
      exit(1);
    }

    for (auto id: visited) {
      fprintf(fptr, "%lu\n", id);
    }

    fclose(fptr);
    pthread_mutex_unlock(&lock_profile);
  }

#ifdef __cplusplus
}
#endif
