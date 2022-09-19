from callgraph import callgraph as callgraph
from callgraph import pccegraph as pccegraph
import callgraph

class pcce:
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

    def write_cc(self, cg, filename):
        print(f'---------------------------------')
        print(f'Writing calling context file')
        print(f'---------------------------------')
        f = open(filename, 'w')
        for u in cg.nodes():
            if cg.isDummyNode(u): continue
            for v, cs in cg.neighbors(u):
                wt = cg.edge_weight((u,v,cs))
                f.write(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}\n')
                print(f'{cg.node2id[u]}-{u}:{cg.node2id[v]}-{v}:{cs}:{wt}')
        f.close()

    def write_numcc(self, cg, filename):
        print(f'---------------------------------')
        print(f'Writing ccnum')
        print(f'---------------------------------')
        max_id = 0
        f = open(filename, 'w')
        for n in cg.reachable_nodes():
            numcc = cg.getnumCC(n)
            f.write(f'{n}:{numcc}\n')
            print(f'{n}:{numcc}')
            if not cg.isDummyNode(n):
                max_id += numcc
        f.close()
        return max_id
