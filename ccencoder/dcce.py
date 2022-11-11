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
                g.set_edge_weight((p,n,cs), -1)
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

    def write_static_cc(self, cg, filename):
         print(f'---------------------------------')
         print(f'Writing calling context file to {filename}')
         print(f'---------------------------------')
         f = open(filename, 'w')
         for u in cg.nodes():
             for v, cs in cg.neighbors(u):
                wt = cg.edge_weight((u,v,cs))
                f.write(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}\n')
                print(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}\n')
         f.close()

    def write_cc(self, cg, outfile, input_cg_file):
        print(f'---------------------------------')
        print(f'Writing calling context file to {outfile}')
        print(f'---------------------------------')

        cc = {} # caller_name-> callsite -> callee_name -> ccw
        for caller in cg.nodes():
            for callee, cs in cg.neighbors(caller):
                wt = cg.edge_weight((caller,callee,cs))
                #f.write(f'{cg.node2id[caller]}-{caller}:{cg.node2id[callee]}-{callee}:{cs}:{wt}\n')
                #print(f'{cg.node2id[caller]}-{caller}:{cg.node2id[callee]}-{callee}:{cs}:{wt}')
                if caller not in cc:
                    cc[caller] = {}
                if cs not in cc[caller]:
                    cc[caller][cs] = {}

                assert(callee not in cc[caller][cs])
                cc[caller][cs][callee] = wt
    
        fout = open(outfile, 'w')
        with open(input_cg_file, 'r') as fin:
            for line in fin:
                line = line.strip()[:-1] # Remove the last comma

                caller, callsite_id, callee_set = line.split(':')
                caller, caller_id = caller.split('-')
                
                fout.write(f'{caller}:{callsite_id}:')
                for cs_callee_ccw in callee_set.split(','):
                    cs, callee, callee_id = cs_callee_ccw.split('-')
                    ccw = cc[caller][callsite_id][callee]
                    fout.write(f'{cs}-{callee}-{ccw},')
                fout.write('\n')
        fout.close()
