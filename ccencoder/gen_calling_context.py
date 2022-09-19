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

    c_cg, c_dcg, node2id = utils.make_callgraph(args.trace, args.scheme, args.root)
    if args.scheme == 'dcce':
        print("dcce")
        ## caculate maxid of cc encoding
        c_encode = dcce()
        max_id = c_encode.maxid(c_cg, args.root)
        c_encode.write_cc(c_cg, f'{args.outdir}/{args.bench}.cg', args.trace)
        print(f'{args.bench} max_id is {max_id}')
        sys.stdout.flush()

        #print ('[%s] num_node       %d' % (args.bench, len(c_cg.nodes())))
        #print ('[%s] num_callsite   %d' % (args.bench, len(c_cg.edges())))
        #print ('[%s] backedge_id is %d' % (args.bench, c_backedge_id))
        #print ('[%s] max_neighbors is %d' % (args.bench, max_neighbors))
        #print ('[%s] mn_maxid is %d' % (args.bench, mn_maxid))
        #print ('[%s] max_incidents is %d' % (args.bench, max_incidents))
        #print ('[%s] mi_maxid is %d' % (args.bench, mi_maxid))
        #render_callgraph(c_cg, args, c_maxids)
        #write_cc_file(args, c_cg, c_maxids[args.root], node2id)
        #write_stats_file(args, c_maxids[args.root]+c_backedge_id, c_backedge_id, \
        #        max_neighbors, max_neighbors_name, mn_maxid, \
        #        max_incidents, max_incidents_name, mi_maxid)
        #write_connectivity(args, connectivity)
        #write_backedge_file(args, c_backedge)
        #write_funcptr_file(args, c_cg)

    elif args.scheme == 'pcce':
        c_encode = pcce.pcce()
        c_encode.instrument_recursive(c_cg, c_dcg)
        c_encode.write_cc(c_cg, f'{args.outdir}/{args.bench}.cg')
        max_id = c_encode.write_numcc(c_dcg, f'{args.outdir}/{args.bench}.numcc')
        print(f'{args.bench} max_id is {max_id}')
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
