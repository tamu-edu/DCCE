import sys
import os
import os.path
import argparse
import utils
from graphviz import Digraph
from callgraph import callgraph as callgraph
from callgraph import pccegraph as pccegraph
from dcce import dcce as dcce

def main(args):
    c_cg, c_dcg, node2id = utils.make_callgraph_dynamic(args.trace, 'dcce', args.root)

    filename = f'{args.outdir}/{args.bench}.stats'
    f = open(filename, 'w')

    # number of nodes
    num_nodes = len(c_cg.nodes())
    num_reachable_nodes = len(c_cg.reachable_nodes())
    # number of edges
    num_edges = len(c_cg.edges())
    reachable_edges, num_indirect_call = c_cg.reachable_edges()
    num_reachable_edges = len(reachable_edges)
    # number of indirect calls

    f.write(f'no. nodes: {num_nodes}\n')
    f.write(f'no. reachable nodes: {num_reachable_nodes}\n')
    f.write(f'no. edges: {num_edges}\n')
    f.write(f'no. reachable edges: {num_reachable_edges}\n')
    f.write(f'no. indirect calls: {num_indirect_call}\n')
    f.write(f'no. back edges: {len(c_cg.getBackEdges())}\n')
    f.write(f'----------- Back Edges ----------\n')
    for u, v, cs in c_cg.getBackEdges():
        f.write(f'{u}--{cs}-->{v}\n')
    f.close()

if __name__== "__main__":
    parser = argparse.ArgumentParser(\
            description='Read call trace file and generate call graph.')
    parser.add_argument('trace',
            type=str, help='input file of function call trace (.cg)')
    parser.add_argument('bench',
            type=str, help='name of benchmark.')
    parser.add_argument('root',
            type=str, help='start node of the callgraph(ex. main)')
    parser.add_argument('outdir',
            type=str, help='output directory')
    parser.add_argument('-s',
            '--show', action='store_true', help='display rendered graph.')

    args = parser.parse_args()

    main(args)
