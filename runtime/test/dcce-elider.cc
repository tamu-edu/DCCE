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

#ifdef __cplusplus
extern "C" {
#endif

  void Split(const std::string& str, std::vector<std::string>& cont, char delim = ' ')
  {
    std::stringstream ss(str);
    std::string token;
    //printf("debug4 - process line %s\n", str.c_str());
    while (std::getline(ss, token, delim)) {
      //printf("debug5 - token %s\n", token.c_str());
      cont.push_back(token);
    }
  }


  std::unordered_set<uint64_t> ecc; 

  int main(int argc, char** argv) {
    if (argc != 3) {
      printf("Usage: %s numFuncEntry numCCID\n", argv[0]);
      exit(1);
    }

    uint64_t numFuncEntry = std::atoi(argv[1]);
    uint64_t numCCID = std::atoi(argv[2]);
    uint64_t totalCCID = numFuncEntry * numCCID;

    std::string ecc_file = "dcce-profile";
    ecc_file += "-" + std::string(argv[1]) + "-" + std::string(argv[2]) + ".ecc";

    std::ifstream inf(ecc_file);
    if (!inf.is_open()) {
      printf("unable to open file %s\n", ecc_file.c_str());
      exit(1);
    }

    std::string line;
    while (std::getline(inf, line)) {
      std::vector<std::string> elidableList;
      Split(line, elidableList, ',');

      for (int i = 0; i < elidableList.size() - 1; i++) {
        try {
          uint64_t elidable_cc = std::stol(elidableList[i], NULL, 10);
          ecc.insert(elidable_cc);
        } catch (const std::out_of_range& oor) {
          printf("elidable cc out of range!!!\n");
          exit(1);
        }
      }
    }

    inf.close();

    volatile uint64_t junk; // to avoid if statement below
    for (int i = 0; i < totalCCID; i++) {
      if (ecc.find(i) != ecc.end()) {
        junk ^= i;
      } else {
        junk ^= ~i;
      }
    }
  }

#ifdef __cplusplus
}

#endif
