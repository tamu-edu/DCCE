#include <iostream>
#include <stdio.h>
#include <cstdint>
#include <vector>
#include <cassert>
#ifdef __cplusplus
extern "C" {
#endif

int64_t ccid = 0;

void addWeight(int64_t weight)
{
    //printf("%ld + %ld = %ld\n", ccid, weight, ccid + weight);
    ccid += weight;
}

void removeWeight(int64_t weight, int64_t nid)
{
    //printf("%ld - %ld = %ld\n", ccid, weight, ccid - weight);
    ccid -= weight;
}

void getCCID(int64_t id, int64_t nid)
{
    //printf("getCCID(%ld): %ld\n", id, ccid);
    return;// ccid;
}

//std::vector<std::pair<int64_t,int64_t>> entry_stack;
//std::vector<std::pair<int64_t,int64_t>> back_stack;
void addWeightRec(int64_t weight, int64_t nid)
{
    //entry_stack.push_back(std::make_pair(ccid, nid));
    //printf("addWeightRec(w:%ld, nid:%ld) - top:%ld\n", weight, nid, entry_stack.size());
}

void removeWeightRec(int64_t weight, int64_t nid)
{
    // FIXME: 657.xz_s dead due to the assert below
    //assert(entry_stack.size() > 0);
    //unsigned long top = entry_stack.size();
    //if (top > 0) {
    //    entry_stack.pop_back();
    //}
    //printf("addWeightRec(w:%ld, nid:%ld) - top:%ld\n", weight, nid, entry_stack.size());
}
#ifdef __cplusplus
}

#endif
