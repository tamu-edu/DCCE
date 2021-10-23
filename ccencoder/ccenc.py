from callgraph import callgraph as callgraph


class ccenc:
    def __init__(self):
        pass

    def maxid(self, g, p):
        # node(unicode) -> max_id (int)
        self.max_id = {}
        # node(unicode) -> T/F (bool)
        self.visited = {}
        # stack to trace stack frame so as to eliminate recursive call
        self.call_stack = []
        self.call_stack2 = []
        self.back_edge = []
        self.back_edge_id = 0
        self.max_neighbors = 0
        self.max_neighbors_name = ''
        self.mn_maxid = 0
        self.max_incidents = 0
        self.max_incidents_name = ''
        self.mi_maxid = 0

        self.sub_maxid = 0

        self.connectivity = {} # node -> (num_neighbors, num_incidents)

        for n in g.nodes():
            self.max_id[n] = 0
            self.visited[n] = False


        n_not_visited = 0
        for n in g.nodes():
            g.add_node_attribute(n, ('label', n+':'+str(self.max_id[n])))
            if self.visited[n] == False:
                n_not_visited += 1
      
        print('not visited nodes: %d' % n_not_visited)
        self.__maxID(g, None, p, None)
        return self.max_id, self.back_edge, self.back_edge_id, \
                self.max_neighbors, self.max_neighbors_name, self.mn_maxid,  \
                self.max_incidents, self.max_incidents_name, self.mi_maxid, self.connectivity


    # p: current node
    # n: one of neighbor nodes
    # l: edge from p to n
    def __maxID(self, g, q, p, r):

        print("\nvisiting %s" % (p))
        self.call_stack.append(p)
        self.call_stack2.append((p, q, r))

        self.max_id[p] = 0
        print("update0 %s.maxid=%d" %(p, self.max_id[p]))
        self.visited[p] = True

        for n, cs in g.neighbors(p):
            if n in self.call_stack:
                str = ''
                add_id = False
                for caller, callee, callsite in self.call_stack2:
                    str += '%s -> ' % (caller)
                    if caller == p or add_id:
                        w = g.edge_weight((caller,callee,callsite))
                        self.back_edge_id += w
                        #print('add_id : %s:%s:%s:%d' %\
                        #        (caller,callee,callsite,w))
                        add_id = True

                str = '%s%s' % (str, n)
                self.back_edge.append(str)
                continue

            self.max_id[p] += 1
            print("update1 %s.maxid=%d" %(p, self.max_id[p]))
            print("insert %d on edge %s->%s" %(self.max_id[p], p, n))

            g.set_edge_weight((p,n,cs), self.max_id[p])
            if not self.visited[n]:
                self.max_id[p] = self.__maxID(g, p,n,cs) + self.max_id[p]
                print("update2 %s.maxid=%d" %(p, self.max_id[p]))
            else:
                self.max_id[p] = self.max_id[p] + self.max_id[n]
                print("update3 %s.maxid=%d" %(p, self.max_id[p]))
        
        ######################################
        # max_neighbors and max_incidents
        ######################################
        #print("num_neighbors of %s: %d" % (p, len(g.neighbors(p))))

        if self.max_id[p] > self.sub_maxid:
            #print("---------------------")
            #print("Found Big Node :: name: %s maxid: %d, num_neighbors: %d num_incidents: %d" % \
            #        (p, self.max_id[p], len(g.neighbors(p)), len(g.incidents(p))))
            #print("---------------------")
            self.sub_maxid = self.max_id[p]

        n_neighbors = len(g.neighbors(p))
        if n_neighbors > self.max_neighbors:
            self.max_neighbors = n_neighbors
            self.max_neighbors_name = p
            self.mn_maxid = 0
            print(g.neighbors(p))
            for nn, cs in g.neighbors(p):
                print("%s %d += %d" % (nn, self.mn_maxid, self.max_id[nn]))
                self.mn_maxid += self.max_id[nn]
            print("---------------------")
            print("New Max Neighbor :: name: %s num_neighbors %d, maxid: %d" % (p, n_neighbors, self.mn_maxid))
            print("---------------------")
        n_incidents = len(g.incidents(p))
        if n_incidents > self.max_incidents:
            self.max_incidents = n_incidents
            self.max_incidents_name = p
            self.mi_maxid = 0
            for nn, cs in g.incidents(p):
                self.mi_maxid += self.max_id[nn]

        assert(p not in self.connectivity)
        self.connectivity[p] = (len(g.neighbors(p)), len(g.incidents(p)))


        print("poping %s ...\n" % p)
        self.call_stack.pop()
        self.call_stack2.pop()
        return self.max_id[p]
