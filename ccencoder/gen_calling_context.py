import sys
import os
import os.path
import argparse
import utils
from graphviz import Digraph
from callgraph import callgraph as callgraph
from callgraph import pccegraph as pccegraph
from dcce import dcce as dcce
import pcce


#def render_callgraph(cg, args, maxids):
#    dot = Digraph()
#    for node in cg.nodes():
#        dot.node(node, label=node+':'+str(maxids[node]))
#
#    for caller, (callee, callsite) in cg.edges():
#        wt = cg.edge_weight((caller,callee,callsite))
#        dot.edge(caller, callee,
#                label=callsite+':'+str(wt))
#
#    ## create dot file and render it
#    dot.save(args.dotfile)
#    #dot.render(args.dotfile, view=args.show, format='png') # FIXME

def main(args):

    # dynamic
    if args.scheme == 'dcce':
        c_cg, c_dcg, node2id = utils.make_callgraph_dynamic(args.trace, args.scheme, args.root)
        ## caculate maxid of cc encoding
        c_encode = dcce()
        max_id = c_encode.maxid(c_cg, args.root)
        
        #c_encode.setEntryEdges(c_cg)
        #print(c_encode.getEntryEdges(c_cg));
        
        c_encode.setBackEdges(c_cg)
        c_encode.getBackEdges(c_cg)
        c_encode.setEntryEdges(c_cg)
        c_encode.getEntryEdges(c_cg)

        c_encode.write_cc(c_cg, f'{args.outdir}/{args.bench}.cg', args.trace)
        print(f'{args.bench} dynamic max_id is {max_id}')
        sys.stdout.flush()
        
        c_cg, c_dcg, node2id = utils.make_callgraph_static(args.trace, args.scheme, args.root)
        ## caculate maxid of cc encoding
        c_encode = dcce()
        max_id = c_encode.maxid(c_cg, args.root)
        c_encode.write_static_cc(c_cg, f'{args.outdir}/{args.bench}.cc')
        print(f'{args.bench} static max_id is {max_id}')
        sys.stdout.flush()
    elif args.scheme == 'pcce':
        c_cg, c_dcg, node2id = utils.make_callgraph_static(args.trace, args.scheme, args.root)
        c_encode = pcce.pcce()
        c_encode.instrument_recursive(c_cg, c_dcg)

        c_encode.setBackEdges(c_cg)
        c_encode.getBackEdges(c_cg)
        c_encode.setEntryEdges(c_cg)
        c_encode.getEntryEdges(c_cg)

        non_zero_edges = c_encode.write_cc(c_cg, f'{args.outdir}/{args.bench}.cc')
        max_id = c_encode.write_numcc(c_dcg, f'{args.outdir}/{args.bench}.numcc')
        print(f'{args.bench} static max_id is {max_id}')
        print(f'{args.bench} static non-zero edges is {non_zero_edges}')
    else:
        print(f"unkonwn scheme {args.scheme}")
        sys.stdout.flush()
        exit(1)
    

if __name__== "__main__":
    parser = argparse.ArgumentParser(\
            description='Read call trace file and generate call graph.')
    parser.add_argument('trace',
            type=str, help='input file of function call trace.')
    parser.add_argument('bench',
            type=str, help='name of benchmark.')
    parser.add_argument('root',
            type=str, help='start node of the callgraph(ex. main)')
    parser.add_argument('scheme',
            type=str, help='scheme(dcce/pcce)')
    parser.add_argument('outdir',
            type=str, help='output directory')
    parser.add_argument('-s',
            '--show', action='store_true', help='display rendered graph.')

    args = parser.parse_args()

    main(args)
