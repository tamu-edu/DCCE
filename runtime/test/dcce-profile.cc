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



  std::unordered_set<uint64_t> ecc; 

  int main(int argc, char** argv) {
    if (argc != 3) {
      printf("Usage: %s numFuncEntry numCCID\n", argv[0]);
      exit(1);
    }

    uint64_t numFuncEntry = std::atoi(argv[1]);
    uint64_t numCCID = std::atoi(argv[2]);
    uint64_t totalCCID = numFuncEntry * numCCID;
    for (int i = 0; i < totalCCID; i++) {
      ecc.insert(i);
    }

    std::string ecc_file = "dcce-profile";
    ecc_file += "-" + std::string(argv[1]) + "-" + std::string(argv[2]) + ".ecc";
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
  }

#ifdef __cplusplus
}

#endif
