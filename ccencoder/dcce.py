from callgraph import callgraph as callgraph


class dcce:
    def __init__(self):
        pass

    def maxid(self, g, p):
        # node(unicode) -> max_id (int)
        self.max_id = {}
        # node(unicode) -> T/F (bool)
        self.visited = {}

        for n in g.nodes():
            self.max_id[n] = 0
            self.visited[n] = False
            g.add_node_attribute(n, ('label', n+':'+str(self.max_id[n])))

        return self.__maxID(g, p)

    # g: call graph
    # q --r--> p
    def __maxID(self, g, p):

        #print("\nvisiting %s" % (p))

        self.max_id[p] = 0
        #print("update0 %s.maxid=%d" %(p, self.max_id[p]))
        self.visited[p] = True

        for n, cs in g.neighbors(p):
            if g.isBackEdge((p, n, cs)):
                print(f'{p}--{cs}-->{n} is backedge.')
                continue

            self.max_id[p] += 1
            #print("update1 %s.maxid=%d" %(p, self.max_id[p]))
            #print("insert %d on edge %s->%s" %(self.max_id[p], p, n))

            g.set_edge_weight((p,n,cs), self.max_id[p])
            if not self.visited[n]:
                self.max_id[p] = self.__maxID(g, n) + self.max_id[p]
                #print("update2 %s.maxid=%d" %(p, self.max_id[p]))
            else:
                self.max_id[p] = self.max_id[p] + self.max_id[n]
                #print("update3 %s.maxid=%d" %(p, self.max_id[p]))
        
        return self.max_id[p]

    def write_cc(self, cg, filename):
        print(f'---------------------------------')
        print(f'Writing calling context file to {filename}')
        print(f'---------------------------------')
        f = open(filename, 'w')
        for u in cg.nodes():
            for v, cs in cg.neighbors(u):
                wt = cg.edge_weight((u,v,cs))
                f.write(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}\n')
                print(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}')
        f.close()
