from callgraph import callgraph as callgraph
from johnson import simple_cycles

class dcce:
    
    nodes_with_back_edge = set()
    set_of_back_edges = set()
    set_of_entry_edges = set()
    number_of_back_edges = {}


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

    

    def setBackEdges(self, g):
        for n in g.nodes():
            self.number_of_back_edges[n] = 0
        
        for cycle in self.findCycles(g):
            for idx in range(0, len(cycle)):
                u = cycle[idx]
                if(idx == len(cycle)-1):
                    v = cycle[0]
                else:
                    v = cycle[idx+1]
        
                for first, second in g.incidents(v):
                    if(u == first and (  len(g.incidents(v)) >=2) and u!=v and (u,v) not in self.set_of_back_edges):
                        self.number_of_back_edges[v] += 1
                        self.nodes_with_back_edge.add(v)
                        self.set_of_back_edges.add((u,v))  #,second))


    def getBackEdges(self, g):
        print('All nodes with a back edge')
        print(self.nodes_with_back_edge)
        print('All back edges in format (p,n)')
        print(self.set_of_back_edges)
        return self.set_of_back_edges

    def setEntryEdges(self, g):
        for m in self.nodes_with_back_edge:
            if(self.number_of_back_edges[m] >= 2):
                for p, cs in g.incidents(m):
                    self.set_of_entry_edges.add((p,m))
            else:
                for p, cs in g.incidents(m):
                    if (p,m) not in self.set_of_back_edges:
                        self.set_of_entry_edges.add((p,m))#,cs))

    def getEntryEdges(self, g):
        print('All entry edges in format (p,n)')
        print(self.set_of_entry_edges)
        return self.set_of_entry_edges

    def findCycles(self, g):
        adj_list = {}
        for node in g.nodes():
            adj_list[node] = []
            for neighbor, callsite in g.neighbors(node):
                adj_list[node].append(neighbor)

        yield from simple_cycles(adj_list)

    def write_static_cc(self, cg, filename):
         print(f'---------------------------------')
         print(f'Writing calling context file to {filename}')
         print(f'---------------------------------')
         f = open(filename, 'w')
         for u in cg.nodes():
             for v, cs in cg.neighbors(u):
                wt = cg.edge_weight((u,v,cs))
                #f.write(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}\n')
                #print(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}\n')
                x = 'R'
                #print(f'This is the node i am setting boi: {u} {v} {cs}')
                if( (u,v) in self.set_of_entry_edges and (u,v) in self.set_of_back_edges):
                    x = 'EB'
                elif( (u,v) in self.set_of_entry_edges): 
                    x = 'E'
                elif( (u,v) in self.set_of_back_edges ): 
                    x = 'B'
                f.write(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}-{x}:{wt}\n')
                print(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}-{x}:{wt}\n')
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
                
                if len(callee_set.split(',')) > 20:
                    continue

                fout.write(f'{caller}:{callsite_id}:')
                for cs_callee_ccw in callee_set.split(','):
                    cs, callee, callee_id = cs_callee_ccw.split('-')
                    ccw = cc[caller][callsite_id][callee]
                    fout.write(f'{cs}-{callee}-{ccw},')
                fout.write('\n')
        fout.close()
