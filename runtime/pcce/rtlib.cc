
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <string>
#include <sstream>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <vector>
#include <cassert>
#ifdef __cplusplus
extern "C" {
#endif

uint64_t ccid = 0;
bool initialized = false;

void Split(const std::string& str, std::vector<std::string>& cont, char delim = ' ')
{
    std::stringstream ss(str);
    std::string token;
    while (std::getline(ss, token, delim)) {
        cont.push_back(token);
    }
}

typedef struct Edge
{
    Edge(uint64_t _id, uint64_t _p, uint64_t _n, uint64_t _w)
        : id(_id), p(_p), n(_n), w(_w) {}
    uint64_t id; // callsite id
    uint64_t p;  // caller
    uint64_t n;  // callee
    uint64_t w;  // weight
} Edge;

typedef struct Node
{
    Node(uint64_t _id, uint64_t _numCC, std::string _name)
        : id(_id), numCC(_numCC), name(_name) {}
    uint64_t id;
    uint64_t numCC;
    std::string name;
} Node;

class CallGraph
{
    public:
        CallGraph() {}
        ~CallGraph()
        {
            // TODO: delete nodes and edges
        }

        void AddEdge(uint64_t id, uint64_t n, uint64_t p, uint64_t w)
        {
            assert(m_edges.find(id) == m_edges.end());
            m_edges.insert(std::make_pair(id, new Edge(id, n, p, w)));
        }

        void AddNode(uint64_t id, uint64_t numCC, std::string name)
        {
            if (m_nodes.find(id) == m_nodes.end()) {
                m_nodes.insert(std::make_pair(id, new Node(id, numCC, name)));
            }
        }

        void AddNeighbor(uint64_t p, uint64_t n, uint64_t l)
        {
            // p (incident) --l--> n (neighbor)

            assert(m_nodes.find(n) != m_nodes.end());
            assert(m_edges.find(l) != m_edges.end());
            m_neighbors[p].insert(std::make_pair(m_nodes[n], m_edges[l]));
        }

        void AddIncident(uint64_t p, uint64_t n, uint64_t l)
        {
            // p (incident) --l(cs)-> n (neighbor)

            assert(m_nodes.find(p) != m_nodes.end());
            assert(m_edges.find(l) != m_edges.end());
            m_incidents[n].insert(std::make_pair(m_nodes[p], m_edges[l]));
        }

        std::set<std::pair<Node*, Edge*> > GetIncidents(uint64_t n)
        {
            if (m_incidents.find(n) == m_incidents.end()) {
                printf("Not found indicents of node %d %s\n", n, GetNodeName(n).c_str());
                return std::set<std::pair<Node*,Edge*> >();
            }
            return m_incidents[n];
        }

        std::set<std::pair<Node*, Edge*> > GetNeighbors(uint64_t p)
        {
            assert(m_incidents.find(p) != m_incidents.end());
            return m_neighbors[p];
        }

        std::string GetNodeName(uint64_t n)
        {
            assert(m_nodes.find(n) != m_nodes.end());
            return m_nodes[n]->name;
        }

        void SetNumCC(uint64_t n, uint64_t numcc)
        {
            assert(m_nodes.find(n) != m_nodes.end());
            m_nodes[n]->numCC = numcc;
        }

    private:
        std::unordered_map<uint64_t, Edge*> m_edges;
        std::unordered_map<uint64_t, Node*> m_nodes;

        std::unordered_map<uint64_t, std::set<std::pair<Node*, Edge*> > > m_neighbors;  // node id -> [ (node, edge), ..]
        std::unordered_map<uint64_t, std::set<std::pair<Node*, Edge*> > > m_incidents;  // node id -> [ (node, edge), ..]


};

CallGraph cg;
std::unordered_map<unsigned int, std::string> input_map;
void initCallgraph(unsigned int bench_code)
{
    initialized = true;
    std::string cc_root = "./output/pcce/ccenc/";
    input_map[600] = cc_root + "600.perlbench_s";
    input_map[602] = cc_root + "602.gcc_s";
    input_map[605] = cc_root + "605.mcf_s";
    input_map[607] = cc_root + "607.cactuBSSN_s";
    input_map[619] = cc_root + "619.lbm_s";
    input_map[620] = cc_root + "620.omnetpp_s";
    input_map[623] = cc_root + "623.xalancbmk_s";
    input_map[625] = cc_root + "625.x264_s";
    input_map[631] = cc_root + "631.deepsjeng_s";
    input_map[638] = cc_root + "638.imagick_s";
    input_map[641] = cc_root + "641.leela_s";
    input_map[644] = cc_root + "644.nab_s";
    input_map[657] = cc_root + "657.xz_s";
    input_map[998] = cc_root + "998.specrand_is";
    input_map[100] = cc_root + "100.test";
    

    std::string ccinput = input_map[bench_code];
    std::ifstream inf(ccinput + ".cc");
    if (!inf.is_open()) {
        printf("unabled to open file %s\n", (ccinput + ".cc").c_str());
        exit(1);
    }

    // 19-_GLOBAL__sub_I_test.cc:0-__cxx_global_var_init:35
    std::string line;
    while (std::getline(inf, line)) {
        std::vector<std::string> list;
        Split(line, list, ':');

        std::vector<std::string> caller_list;
        Split(list[0], caller_list, '-');
        uint64_t caller_id = std::stoul(caller_list[0], NULL, 10);
        std::string caller_name = caller_list[1];

        std::vector<std::string> callee_list;
        Split(list[1], callee_list, '-');
        uint64_t callee_id = std::stoul(callee_list[0], NULL, 10);
        std::string callee_name = callee_list[1];

        uint64_t callsite_id  = std::stoul(list[2], NULL, 10);

        uint64_t weight = 0;
        try {
            weight = std::stoul(list[3], NULL, 10);
        } catch (const std::out_of_range& oor) {
            printf("out of range!!!\n");
        }

        //printf("%d-%s:%d-%s:%d\n",
        //        caller_id, caller_name.c_str(),
        //        callee_id, callee_name.c_str(),
        //        callsite_id);

        cg.AddEdge(callsite_id, caller_id, callee_id, weight);
        cg.AddNode(caller_id, 0, caller_name);
        cg.AddNode(callee_id, 0, callee_name);
        cg.AddNeighbor(caller_id, callee_id, callsite_id);
        cg.AddIncident(caller_id, callee_id, callsite_id);
    }
    inf.close();

    std::ifstream inf2(ccinput + ".numcc");
    if (!inf2.is_open()) {
        printf("unabled to open numccfile\n");
        exit(1);
    }

    //printf("\nnumCC's\n");
    while (std::getline(inf2, line)) {
        std::vector<std::string> list;
        Split(line, list, ':');

        std::vector<std::string> node_list;
        Split(list[0], node_list, '-');
        uint64_t nid = std::stoul(node_list[0], NULL, 10);
        std::string name = node_list[1];

        uint64_t numcc = std::stoul(list[1], NULL, 10);

        //printf("%d-%s:%d\n", nid, name.c_str(), numcc);
        //printf("Setting numcc(%d) to %s\n", numcc, cg.GetNodeName(nid).c_str());
        cg.SetNumCC(nid, numcc);
    }
    inf2.close();
}

void decode(uint64_t nid)
{
    if (!initialized) return;
    uint64_t n = nid;
    std::string cc = cg.GetNodeName(n);
    uint64_t id = ccid;

    //printf("Starting decoding for node %d (%s) - \n", nid, cg.GetNodeName(nid).c_str(), cc.c_str());

    while (cg.GetNodeName(n) != "main") {
        Node* p = NULL;
        Edge* e = NULL;
        //printf("For node %s and current id: %d\n", cg.GetNodeName(n).c_str(), id);
        for (auto &node_edge : cg.GetIncidents(n)) {
            p = node_edge.first;
            e = node_edge.second;
            //printf("    check incomming edge(id:%d, w:%d) from node (%s, %d)\n",
            //        e->id, e->w,
            //        (p->name).c_str(), p->numCC);
            if (e->w <= id && id < e->w + p->numCC) {
                cc = p->name + " -> " + cc;
                id = id - e->w ;

                //printf("    move up to node (%s, %d)\n",
                //        (p->name).c_str(), p->numCC);
                break;
            }
        }
        if (p != NULL) return;
        n = p->id;
    }
    //printf("Decoded cc: %s\n", cc.c_str());
}

void addWeight(uint64_t weight)
{
    //printf("%llu + %llu = %llu\n", ccid, weight, ccid + weight);
    ccid += weight;
}

void removeWeight(uint64_t weight)
{
    //printf("%llu - %llu = %llu\n", ccid, weight, ccid - weight);
    ccid -= weight;
}
#ifdef __cplusplus
}
#endif
