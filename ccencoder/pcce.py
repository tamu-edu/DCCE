from callgraph import callgraph as callgraph
import callgraph

class pcce:
    def __init__(self, c_cg):
        self.pcceObj = c_cg
        self.checkmain = 0

    def annotate_recursive(self, N, E):
        NPrime = {}
        EPrime = {}
        for n in N:
            NPrime[n].append(1)
        for e in E:
            EPrime[e].append((1, self.pcceObj.get_root(), 0))
        for n in NPrime:
            for e in EPrime:
                if e in self.pcceObj.dummyList:
            #for p, l in self.pcceObj.incidents(n):
                    EPrime.remove(e)
                    EPrime[e].append((1, n, 0))
                    self.pcceObj.annotate(NPrime, EPrime)

    def instrument_recursive(self, N, E):
        self.pcceObj.annotate_recursive(N, E)
        for n in N:
            Wt = 0
            if NPrime[n] == True:
                s = 1
            else:
                s = 0
            # edges should have a serial order to recognize backedges
            
            for p, l in self.pcceObj.incidents(n):
#                if e is not a backedge then:
                if s is not 1:
                    self.pcceObj.set_edge_weight((p, n, l), Wt)
                    print("Weight: %d Caller: %s Callee: %s" % (Wt, p, n))
                    Wt = Wt + self.pcceObj.numCC[p]                    
                else:
                    self.pcceObj.push(self.pcceObj.getnumCC(n), Wt)
                    self.pcceObj.setnumCC(n, p, s)
                    self.pcceObj.pop(self.pcceObj.getnumCC(n), Wt)
#                    insert push(id, l) before l
#                    insert id = 0 before l
#                    insert id = pop().first after l

    def annotate(self, N, E):
        for n in N:
            for p, l in self.pcceObj.incidents(n):
#               print("p: %s, s: %s" % (p, l))
                self.pcceObj.setnumCC(n, p)
                print("numCC: %d Caller: %s Callee: %s" % (self.pcceObj.getnumCC(n), p, n))

    def instrument(self, N, E):
        N = self.pcceObj.sorted_nodes(N, E)
        self.annotate(N, E)
        for n in N:
            Wt = 0
            for p, l in self.pcceObj.incidents(n):
                self.pcceObj.set_edge_weight((p, n, l), Wt)
                print("Weight: %d Caller: %s Callee: %s" % (Wt, p, n))
                Wt = Wt + self.pcceObj.numCC[p]
#            id = id + getValueS()
#                
#            id = id - getValueS()
#            insert id = id + s before l
#            insert id = id - s after l

#    def maxid(self, g, p):
#        # node(unicode) -> max_id (int)
#        self.max_id = {}
#        # node(unicode) -> T/F (bool)
#        self.visited = {}
#        # stack to trace stack frame so as to eliminate recursive call
#        self.call_stack = []
#        self.call_stack2 = []
#        self.back_edge = []
#        self.back_edge_id = 0
#        self.max_neighbors = 0
#
#        for n in g.nodes():
#            self.max_id[n] = 0
#            self.visited[n] = False
#
#
#        n_not_visited = 0
#        for n in g.nodes():
#            g.add_node_attribute(n, ('label', n+':'+str(self.max_id[n])))
#            if self.visited[n] == False:
#                n_not_visited += 1
#      
#        print('not visited nodes: %d' % n_not_visited)
#        self.__maxID(g, None, p, None)
#        return self.max_id, self.back_edge, self.back_edge_id, self.max_neighbors
#
#
#    # p: current node
#    # n: one of neighbor nodes
#    # l: edge from p to n
#    def __maxID(self, g, q, p, r):
#
#        print("\nvisiting %s" % (p))
#        self.call_stack.append(p)
#        self.call_stack2.append((p, q, r))
#
#        self.max_id[p] = 0
#        print("update0 %s.maxid=%d" %(p, self.max_id[p]))
#        self.visited[p] = True
#
#        #print("num_neighbors of %s: %d" % (p, len(g.neighbors(p))))
#        n_neighbors = len(g.neighbors(p))
#        if n_neighbors > self.max_neighbors:
#            self.max_neighbors = n_neighbors
#        for n, cs in g.neighbors(p):
#            if n in self.call_stack:
#                str = ''
#                add_id = False
#                for caller, callee, callsite in self.call_stack2:
#                    str += '%s -> ' % (caller)
#                    if caller == p or add_id:
#                        w = g.edge_weight((caller,callee,callsite))
#                        self.back_edge_id += w
#                        #print('add_id : %s:%s:%s:%d' %\
#                        #        (caller,callee,callsite,w))
#                        add_id = True
#
#                str = '%s%s' % (str, n)
#                self.back_edge.append(str)
#                continue
#
#            self.max_id[p] += 1
#            print("update1 %s.maxid=%d" %(p, self.max_id[p]))
#            print("insert %d on edge %s->%s" %(self.max_id[p], p, n))
#
#            g.set_edge_weight((p,n,cs), self.max_id[p])
#            if not self.visited[n]:
#                self.max_id[p] = self.__maxID(g, p,n,cs) + self.max_id[p]
#                print("update2 %s.maxid=%d" %(p, self.max_id[p]))
#            else:
#                self.max_id[p] = self.max_id[p] + self.max_id[n]
#                print("update3 %s.maxid=%d" %(p, self.max_id[p]))
#
#        print("poping %s ...\n" % p)
#        self.call_stack.pop()
#        self.call_stack2.pop()
#        return self.max_id[p]
