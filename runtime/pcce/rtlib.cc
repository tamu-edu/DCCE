#include <stdio.h>
#include <iostream>
#include <string>
#include <cstdint>

uint64_t ccid = 0;

struct Edge
{
    uint64_t p;  // source
    uint64_t n;  // destination
    uint64_t l;  // callsite

    Edge() : p(0), n(0), l(0) {}
};

class CallGraph
{
    public:
        CallGraph(std::string input)
        {
        }

        std::string GetNodeName(uint64_t weight) { return ""; } 
        uint64_t GetRootID() { return 0; } 
        std::unordered_set<Edge*>* ForEachIncommingEdges(uint64_t nid)
        {
            assert(_n2ie.find(nid) != _n2id.end());
            return _n2ie[nid];
        }


        // NodeID -> Set of Incomming Edges
        typedef std::unordered_map<uint64_t, std::unordered_set<Edge*>> Node2IE;
    private:
        Node2IE _n2ie;

};

void addWeight(uint64_t weight)
{
    //printf("%llu + %llu = %llu\n", ccid, weight, ccid + weight);
    ccid += weight;
}

void removeWeight(uint64_t weight)
{
    //printf("%llu - %llu = %llu\n", ccid, weight, ccid - weight);
    ccid += weight;
}


void decode(uint64_t node_id)
{
    std::string cc = cg->GetNodeName(node_id);
    long long root_id = cg->GetRootID();

    int n = node_id;
    while (node_id != root_id) {
        for (auto &e : *(cg->ForEachIncommingEdges())) {
            if (e.weight <= ccid && ccid < e.weight + numCC[e.p]) {
                cc = pl + cc;
                break;
            }
        }
        n = p;
    }
}
