#!/usr/bin/python3
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
        return self.max_id, self.back_edge, self.back_edge_id, self.max_neighbors


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

        #print("num_neighbors of %s: %d" % (p, len(g.neighbors(p))))
        n_neighbors = len(g.neighbors(p))
        if n_neighbors > self.max_neighbors:
            self.max_neighbors = n_neighbors
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

        print("poping %s ...\n" % p)
        self.call_stack.pop()
        self.call_stack2.pop()
        return self.max_id[p]
