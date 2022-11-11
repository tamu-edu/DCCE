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
#include <functional>
#ifdef __cplusplus
extern "C" {
#endif

int64_t ccid = 0;
bool initialized = false;

//std::vector<std::pair<int64_t,int64_t>> stack;


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

typedef struct Edge
{
    Edge(int64_t _id, int64_t _p, int64_t _n, int64_t _w)
        : id(_id), p(_p), n(_n), w(_w) {}
    int64_t id; // callsite id
    int64_t p;  // caller
    int64_t n;  // callee
    int64_t w;  // weight
} Edge;

typedef struct Node
{
    Node(int64_t _id, int64_t _numCC, std::string _name)
        : id(_id), numCC(_numCC), name(_name) {}
    int64_t id;
    int64_t numCC;
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

        void AddEdge(int64_t id, int64_t n, int64_t p, int64_t w)
        {
            assert(m_edges.find(id) == m_edges.end());
            m_edges.insert(std::make_pair(id, new Edge(id, n, p, w)));
        }

        void AddNode(int64_t id, int64_t numCC, std::string name)
        {
            if (m_nodes.find(id) == m_nodes.end()) {
                m_nodes.insert(std::make_pair(id, new Node(id, numCC, name)));
            }
        }

        void AddNeighbor(int64_t p, int64_t n, int64_t l)
        {
            // p (incident) --l--> n (neighbor)

            assert(m_nodes.find(n) != m_nodes.end());
            assert(m_edges.find(l) != m_edges.end());
            m_neighbors[p].insert(std::make_pair(m_nodes[n], m_edges[l]));
        }

        void AddIncident(int64_t p, int64_t n, int64_t l)
        {
            // p (incident) --l(cs)-> n (neighbor)

            assert(m_nodes.find(p) != m_nodes.end());
            assert(m_edges.find(l) != m_edges.end());
            m_incidents[n].insert(std::make_pair(m_nodes[p], m_edges[l]));
        }

        std::set<std::pair<Node*, Edge*> > GetIncidents(int64_t n)
        {
            if (m_incidents.find(n) == m_incidents.end()) {
                //printf("Not found indicents of node %d %s\n", n, GetNodeName(n).c_str());
                return std::set<std::pair<Node*,Edge*> >();
            }
            return m_incidents[n];
        }

        std::set<std::pair<Node*, Edge*> > GetNeighbors(int64_t p)
        {
            assert(m_incidents.find(p) != m_incidents.end());
            return m_neighbors[p];
        }

        std::string GetNodeName(int64_t n)
        {
            if (!initialized || m_nodes.find(n) == m_nodes.end()) {
                //printf("unknown node : %ld\n", n);
                // TODO: find better solution
                return "danguria-skip";
            }
            
            return m_nodes[n]->name;
        }

        void SetNumCC(int64_t n, int64_t numcc)
        {
            assert(m_nodes.find(n) != m_nodes.end());
            m_nodes[n]->numCC = numcc;
        }

    private:
        std::unordered_map<int64_t, Edge*> m_edges;
        std::unordered_map<int64_t, Node*> m_nodes;

        std::unordered_map<int64_t, std::set<std::pair<Node*, Edge*> > > m_neighbors;  // node id -> [ (node, edge), ..]
        std::unordered_map<int64_t, std::set<std::pair<Node*, Edge*> > > m_incidents;  // node id -> [ (node, edge), ..]


};

CallGraph cg;
std::unordered_map<unsigned int, std::string> input_map;
void initCallgraph(unsigned int bench_code)
{
    //printf("Initialze the graph: code: %u\n", bench_code);
    initialized = true;
    return;
    std::string cc_root = "/home/ksungkeun84/git/DCCE/output/ccenc/pcce";
    input_map[100] = cc_root + "/test/100.test-pcce-fig-4";
    input_map[101] = cc_root + "/test/101.test-pcce-fig-5a";
    input_map[102] = cc_root + "/test/102.test-indirect-call";
    input_map[103] = cc_root + "/test/103.test-libc-nostatic-nodebug";
    input_map[103] = cc_root + "/test/103.test-libc-static-nodebug";
    input_map[103] = cc_root + "/test/103.test-libc-static-debug";
    input_map[104] = cc_root + "/test/104.test-backedge";
    input_map[105] = cc_root + "/test/105.test-functionname";
    input_map[106] = cc_root + "/test/106.test-machinecode";
    input_map[108] = cc_root + "/test/108.test-mleak";
    input_map[109] = cc_root + "/test/109.test-matadd";
    input_map[110] = cc_root + "/test/110.test-tail-call";

    input_map[505] = cc_root + "/SPEC2017/505.mcf_r";
    input_map[508] = cc_root + "/SPEC2017/508.namd_r";
    input_map[510] = cc_root + "/SPEC2017/510.parest_r";
    input_map[519] = cc_root + "/SPEC2017/519.lbm_r";
    input_map[523] = cc_root + "/SPEC2017/523.xalancbmk_r";
    input_map[525] = cc_root + "/SPEC2017/525.x264_r";
    input_map[541] = cc_root + "/SPEC2017/541.leela_r";
    input_map[557] = cc_root + "/SPEC2017/557.xz_r";
    input_map[605] = cc_root + "/SPEC2017/605.mcf_s";
    input_map[619] = cc_root + "/SPEC2017/619.lbm_s";
    input_map[623] = cc_root + "/SPEC2017/623.xalancbmk_s";
    input_map[625] = cc_root + "/SPEC2017/625.x264_s";
    input_map[641] = cc_root + "/SPEC2017/641.leela_s";
    input_map[657] = cc_root + "/SPEC2017/657.xz_s";
        
    input_map[701] = cc_root + "/Splash-3/701.BARNES";
    input_map[702] = cc_root + "/Splash-3/702.CHOLESKY";
    input_map[703] = cc_root + "/Splash-3/703.FFT";
    input_map[704] = cc_root + "/Splash-3/704.FMM";
    input_map[705] = cc_root + "/Splash-3/705.LU-CB";
    input_map[706] = cc_root + "/Splash-3/706.LU-NCB";
    input_map[707] = cc_root + "/Splash-3/707.OCEAN-CP";
    input_map[708] = cc_root + "/Splash-3/708.OCEAN-NCP";
    input_map[709] = cc_root + "/Splash-3/709.RADIOSITY";
    input_map[710] = cc_root + "/Splash-3/710.RADIX";
    input_map[713] = cc_root + "/Splash-3/713.WATER-NSQUARED";
    input_map[714] = cc_root + "/Splash-3/714.WATER-SPATIAL";
    

    //printf("debug1\n");
    std::string ccinput = input_map[bench_code] + ".cc";
    std::ifstream inf(ccinput);
    if (!inf.is_open()) {
        //printf("unable to open file %s\n", ccinput.c_str());
        exit(1);
    }
    //printf("debug2\n");

    // 19-_GLOBAL__sub_I_test.cc:0-__cxx_global_var_init:35
    std::string line;
    while (std::getline(inf, line)) {
        std::vector<std::string> list;
        //printf("debug3\n");
        Split(line, list, ':');
        //printf("debug4\n");

        std::vector<std::string> caller_list;
        Split(list[0], caller_list, '-');
        int64_t caller_id = std::stol(caller_list[0], NULL, 10);
        std::string caller_name = caller_list[1];

        std::vector<std::string> callee_list;
        Split(list[1], callee_list, '-');
        int64_t callee_id = std::stol(callee_list[0], NULL, 10);
        std::string callee_name = callee_list[1];

        int64_t callsite_id  = std::stol(list[2], NULL, 10);

        int64_t weight = 0;
        try {
            weight = std::stoul(list[3], NULL, 10);
        } catch (const std::out_of_range& oor) {
            printf("weight out of range!!!\n");
        }

        //printf("%lu-%s:%lu-%s:%lu\n",
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

    ccinput = input_map[bench_code] + ".numcc";
    std::ifstream inf2(ccinput);
    if (!inf2.is_open()) {
        printf("unable to open numccfile %s\n", ccinput.c_str());
        exit(1);
    }

    //printf("\nnumCC's\n");
    while (std::getline(inf2, line)) {
        //printf("processing %s\n", line.c_str());
        std::vector<std::string> list;
        Split(line, list, ':');

        std::vector<std::string> node_list;
        Split(list[0], node_list, '=');
        int64_t nid = std::stol(node_list[0], NULL, 10);
        std::string name = node_list[1];

        int64_t numcc = 0;
        try {
            numcc = std::stoul(list[1], NULL, 10);
        } catch (const std::out_of_range& oor) {
            printf("numcc out of range!!!\n");
        }

        //printf("%lu-%s:%lu\n", nid, name.c_str(), numcc);
        //printf("Setting numcc(%lu) to %s\n", numcc, cg.GetNodeName(nid).c_str());
        cg.SetNumCC(nid, numcc);
    }
    inf2.close();
    //printf("Initialze done\n");
}

std::hash<std::string> cchash;
void getCCID(int64_t nid)
{
    //printf("getCCID(%ld)\n", nid);
    if (!initialized) return;
    //std::string fname = cg.GetNodeName(nid) + std::to_string(ccid);
    //uint64_t h = cchash(fname);
    uint64_t h = cchash("test-function");
    //printf("hash(%s) = %ld\n", fname.c_str(), h);
}

//void getCCID(int64_t nid)
//{
//    //printf("getCCID(%lu)\n", nid);
//    if (!initialized) return;
//    int64_t n = nid;
//    std::string cc = cg.GetNodeName(n);
//    int64_t id = ccid;
//
//    std::vector<std::pair<int64_t,int64_t>> tmp_stack(stack);
//    //printf("Starting decoding for node %ld (%s) - \n", nid, cg.GetNodeName(nid).c_str());
//
//    while (true) {
//        // BEGIN decode
//        while (cg.GetNodeName(n) != "main" && cg.GetNodeName(n) != "danguria-skip") {
//            Node* p = NULL;
//            Edge* e = NULL;
//            //printf("For node %s and current id: %ld\n", cg.GetNodeName(n).c_str(), id);
//            for (auto &node_edge : cg.GetIncidents(n)) {
//                if (node_edge.second->w == -1) continue;
//                p = node_edge.first;
//                e = node_edge.second;
//                //printf("    check incomming edge(id:%ld, w:%ld) from node (%s, %ld) -- %ld <= %ld < %ld\n",
//                //        e->id, e->w,
//                //        (p->name).c_str(), p->numCC,
//                //       e->w, id, e->w + p->numCC);
//                if (e->w <= id && id <  e->w + p->numCC) {
//                    cc = p->name + " -> " + cc;
//                    id = id - e->w;
//
//                    //printf("    move up to node (%s, %ld)\n",
//                    //        (p->name).c_str(), p->numCC);
//                    break;
//                }
//            }
//            if (p == NULL) return;
//            n = p->id;
//        }
//        // END decode
//
//        int top = tmp_stack.size();
//        if (top == 0) {
//            //printf("no more recursive call\n");
//            break;
//        }
//        int64_t id = tmp_stack[top-1].first;
//        int64_t n = tmp_stack[top-1].second;
//        tmp_stack.pop_back();
//        //printf("decode more for recursive call cc so far : %s, new_id: %ld, n: %ld\n", cc.c_str(), id, n);
//    }
//    //printf("Decoded cc: %s\n", cc.c_str());
//}

void addWeight(int64_t weight, int64_t nid)
{
    //printf("Before callsite, [nid:%ld] %lu + %lu => %lu\n", nid, ccid, weight, ccid + weight);
    ccid += weight;
}

void addWeightRec(int64_t weight, int64_t nid)
{
    //stack.push_back(std::make_pair(ccid, nid));
    //ccid = 0;
    //printf("Before callsite, backedge, push ccid: %ld nid: %ld [top:%ld]\n", ccid, nid, stack.size());
}

void removeWeight(int64_t weight, int64_t nid)
{
    //printf("After callsite [nid:%ld] %lu - %lu => %lu\n", nid, ccid, weight, ccid - weight);
    ccid -= weight;
}

void removeWeightRec(int64_t weight, int64_t nid)
{
    //unsigned long top = stack.size();
    //// FIXME
    ////assert(top > 0);
    //if (top > 0) {
    //    ccid = stack[top-1].first;
    //    stack.pop_back();
    //    printf("After callsite, backedge, pop ccid: %ld [top:%ld]\n", ccid, top);

    //}
}

#ifdef __cplusplus
}

#endif
