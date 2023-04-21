
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
                //printf("unknown node : %lu\n", n);
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
void initCallgraph(unsigned int bench_code)
{
    //printf("Initialze the graph: code: %u\n", bench_code);
    initialized = true;
    std::string ccinput = "/home/ksungkeun84/git/DCCE/output/ccenc/pcce";
    return;
    switch (bench_code) {

      case 100: ccinput += "/test/100.test-pcce-fig-4"; break;
      case 101: ccinput += "/test/101.test-pcce-fig-5a"; break;
      case 102: ccinput += "/test/102.test-indirect-call"; break;
      case 103: ccinput += "/test/103.test-libc-nostatic-nodebug"; break;
                //case 103: ccinput += "/test/103.test-libc-static-nodebug";
                //case 103: ccinput += "/test/103.test-libc-static-debug";
      case 104: ccinput += "/test/104.test-backedge"; break;
      case 105: ccinput += "/test/105.test-functionname"; break;
      case 106: ccinput += "/test/106.test-machinecode"; break;
      case 108: ccinput += "/test/108.test-mleak"; break;
      case 109: ccinput += "/test/109.test-matadd"; break;
      case 110: ccinput += "/test/110.test-tail-call"; break;
      case 111: ccinput += "/test/111.barrier-elision"; break;

      case 505: ccinput += "/SPEC2017/505.mcf_r"; break;
      case 508: ccinput += "/SPEC2017/508.namd_r"; break;
      case 510: ccinput += "/SPEC2017/510.parest_r"; break;
      case 519: ccinput += "/SPEC2017/519.lbm_r"; break;
      case 523: ccinput += "/SPEC2017/523.xalancbmk_r"; break;
      case 525: ccinput += "/SPEC2017/525.x264_r"; break;
      case 541: ccinput += "/SPEC2017/541.leela_r"; break;
      case 557: ccinput += "/SPEC2017/557.xz_r"; break;
      case 605: ccinput += "/SPEC2017/605.mcf_s"; break;
      case 619: ccinput += "/SPEC2017/619.lbm_s"; break;
      case 623: ccinput += "/SPEC2017/623.xalancbmk_s"; break;
      case 625: ccinput += "/SPEC2017/625.x264_s"; break;
      case 641: ccinput += "/SPEC2017/641.leela_s"; break;
      case 657: ccinput += "/SPEC2017/657.xz_s"; break;

      case 701: ccinput += "/Splash-3/701.BARNES"; break;
      case 702: ccinput += "/Splash-3/702.CHOLESKY"; break;
      case 703: ccinput += "/Splash-3/703.FFT"; break;
      case 704: ccinput += "/Splash-3/704.FMM"; break;
      case 705: ccinput += "/Splash-3/705.LU-CB"; break;
      case 706: ccinput += "/Splash-3/706.LU-NCB"; break;
      case 707: ccinput += "/Splash-3/707.OCEAN-CP"; break;
      case 708: ccinput += "/Splash-3/708.OCEAN-NCP"; break;
      case 709: ccinput += "/Splash-3/709.RADIOSITY"; break;
      case 710: ccinput += "/Splash-3/710.RADIX"; break;
      case 713: ccinput += "/Splash-3/713.WATER-NSQUARED"; break;
      case 714: ccinput += "/Splash-3/714.WATER-SPATIAL"; break;
    }
    

    //std::string ccinput = input_map[bench_code] + ".cc";
    std::string ccinput_cc = ccinput + ".cc";
    std::ifstream inf(ccinput_cc);
    if (!inf.is_open()) {
        //printf("unable to open file %s\n", ccinput.c_str());
        exit(1);
    }

    // 19-_GLOBAL__sub_I_test.cc:0-__cxx_global_var_init:35
    std::string line;
    while (std::getline(inf, line)) {
        std::vector<std::string> list;
        Split(line, list, ':');

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

    std::string ccinput_numcc = ccinput + ".numcc";
    std::ifstream inf2(ccinput_numcc);
    if (!inf2.is_open()) {
        printf("unable to open numccfile %s\n", ccinput_numcc.c_str());
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
//void getCCID(int64_t nid)
//{
//    //printf("getCCID(%lu)\n", nid);
//    if (!initialized) return;
//    int64_t n = nid;
//    std::string cc = cg.GetNodeName(n);
//    int64_t id = ccid;
//
//    std::vector<std::pair<int64_t,int64_t>> tmp_stack(stack);
//    //printf("Starting decoding for node %lu (%s) - \n", nid, cg.GetNodeName(nid).c_str());
//
//    while (true) {
//        // BEGIN decode
//        while (cg.GetNodeName(n) != "main" && cg.GetNodeName(n) != "danguria-skip") {
//            Node* p = NULL;
//            Edge* e = NULL;
//            //printf("For node %s and current id: %lu\n", cg.GetNodeName(n).c_str(), id);
//            for (auto &node_edge : cg.GetIncidents(n)) {
//                if (node_edge.second->w == -1) continue;
//                p = node_edge.first;
//                e = node_edge.second;
//                //printf("    check incomming edge(id:%lu, w:%lu) from node (%s, %lu) -- %lu <= %lu < %lu\n",
//                //        e->id, e->w,
//                //        (p->name).c_str(), p->numCC,
//                //       e->w, id, e->w + p->numCC);
//                if (e->w <= id && id <  e->w + p->numCC) {
//                    cc = p->name + " -> " + cc;
//                    id = id - e->w;
//
//                    //printf("    move up to node (%s, %lu)\n",
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
//        //printf("decode more for recursive call cc so far : %s, new_id: %lu, n: %lu\n", cc.c_str(), id, n);
//    }
//    //printf("Decoded cc: %s\n", cc.c_str());
//}
