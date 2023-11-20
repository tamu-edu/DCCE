from callgraph import callgraph as callgraph
from callgraph import pccegraph as pccegraph
from johnson import simple_cycles
import callgraph

class pcce:

    nodes_with_back_edge = set()
    set_of_back_edges = set()
    set_of_entry_edges = set()
    number_of_back_edges = {}

    def __init__(self):
        pass

    def annotate_recursive(self, cg, dcg):
        # make dummy node and edge
        dcg.addDummy()

        for e in cg.getBackEdges():
            dcg.transform(e)
        cg.print_graph('Original Graph')
        dcg.print_graph('Transformed Graph')
        self.annotate(dcg)

    def instrument_recursive(self, cg, dcg):
        """
        cg: Original Graph
        dcg: will be transformed. Must be equivalent to cg initially 
        """
        assert(cg == dcg)
        self.annotate_recursive(cg, dcg)
        print('----------------------------')
        print('instrument_recursive')
        print('----------------------------')
        for n in cg.nodes():
            if dcg.hasDummyEdge(n):
                s = 1
            else:
                s = 0
            
            #print(f'Checking {n} (has dummy edge: {s})')

            for p, l in cg.incidents(n):
                #print(f'Checking ({p},{n},{l}) in {cg.getBackEdges()}')
                if not cg.isBackEdge((p, n, l)):
                    # insert id = id + s before l
                    # insert id = id - s after l
                    #print(f'{p}--({s})--{n}')
                    cg.set_edge_weight((p, n, l), s)
                    s = s + dcg.getnumCC(p)
                else:
                    cg.set_edge_weight((p, n, l), -1)
                    #print(f'{p}--(-1)--{n}')
                    # insert push(<id, l>) before l
                    # insert id = 0 before l
                    # insert id = pop().first after l

    def annotate(self, cg):
        N = cg.sorted_nodes()
        for n in N:
            for p, l in cg.incidents(n):
                cg.setnumCC(n, p)

    def instrument(self, cg):
        self.annotate(cg)
        for n in cg.nodes():
            s = 0
            for p, l in cg.incidents(n):
                cg.set_edge_weight((p, n, l), s)
                s = s + cg.numCC[p]

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

        temp = simple_cycles(adj_list)[0]
        print(temp)
        return temp

    def write_cc(self, cg, filename):
        print(f'---------------------------------')
        print(f'Writing calling context file')
        print(f'---------------------------------')
        f = open(filename, 'w')
        non_zero_edges = 0
        for u in cg.nodes():
            if cg.isDummyNode(u): continue
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
                if wt > 0: non_zero_edges += 1
        f.close()
        return non_zero_edges

    def write_numcc(self, cg, filename):
        print(f'---------------------------------')
        print(f'Writing ccnum')
        print(f'---------------------------------')
        max_id = 0
        f = open(filename, 'w')
        for n in cg.reachable_nodes():
            numcc = cg.getnumCC(n)
            if cg.isDummyNode(n):
                continue
            else:
                f.write(f'{cg.node2id[n]}={n}:{numcc}\n')
                print(f'{cg.node2id[n]}={n}:{numcc}\n')
            if not cg.isDummyNode(n):
                max_id += numcc
        f.close()
        return max_id
