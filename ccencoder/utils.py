import sys
import os
import os.path
import argparse
from callgraph import callgraph as callgraph
from callgraph import pccegraph as pccegraph
from dcce import dcce as dcce

def make_callgraph_dynamic(input_cg, scheme, root):
    c_calls       = set() # [ (caller, callee, callsite) , ... ]
    c_nodes       = set()

    # main-2:2:A-0,B-1,
    node2id = {}
    with open(input_cg, 'r') as f:
        for line in f:
            print(f'processing {line}')
            line = line.strip()[:-1] # Remove the last comma

            caller, callsite_id, callee_set = line.split(':')
            caller, caller_id = caller.split('-')

            for cs_callee_ccw in callee_set.split(','):
                cs, callee, callee_id = cs_callee_ccw .split('-')
                c_calls.add((caller, callee, callsite_id))
                c_nodes.add(caller)
                c_nodes.add(callee)

                node2id[caller] = caller_id
                node2id[callee] = callee_id

            #caller, callee, callsite = line.split(':')
            #caller_id = caller.split('-')[0]
            #caller = caller.split('-')[1]
            #callee_id = callee.split('-')[0]
            #callee = callee.split('-')[1]


    c_cg = None
    c_dcg = None
    if scheme == 'pcce':
        c_cg = pccegraph(root, node2id)
        c_dcg = pccegraph(root, node2id)
    else:
        c_cg = callgraph(root, node2id)
        c_dcg = callgraph(root, node2id)

    for node in c_nodes:
        c_cg.add_node(node)
        c_dcg.add_node(node)
    for caller, callee, callsite in c_calls:
        c_cg.add_edge((caller,callee,callsite),
                wt=0,label=callsite)
        c_dcg.add_edge((caller,callee,callsite),
                wt=0,label=callsite)

    #if remove_not_visited_node:
    #    utils.remove_not_visited_node(c_cg, args.root)

    return c_cg, c_dcg, node2id

def make_callgraph_static(input_cg, scheme, root):
    c_calls       = set() # [ (caller, callee, callsite) , ... ]
    c_nodes       = set()

    # main-2:2:A-0,B-1,
    node2id = {}
    with open(input_cg, 'r') as f:
        for line in f:
            print(f'processing {line}')
            line = line.strip()[:-1] # Remove the last comma

            caller, callsite_id, callee_set = line.split(':')
            caller, caller_id = caller.split('-')

            for cs_callee_ccw in callee_set.split(','):
                cs, callee, callee_id = cs_callee_ccw .split('-')
                c_calls.add((caller, callee, cs))
                c_nodes.add(caller)
                c_nodes.add(callee)

                node2id[caller] = caller_id
                node2id[callee] = callee_id

            #caller, callee, callsite = line.split(':')
            #caller_id = caller.split('-')[0]
            #caller = caller.split('-')[1]
            #callee_id = callee.split('-')[0]
            #callee = callee.split('-')[1]


    c_cg = None
    c_dcg = None
    if scheme == 'pcce':
        c_cg = pccegraph(root, node2id)
        c_dcg = pccegraph(root, node2id)
    else:
        c_cg = callgraph(root, node2id)
        c_dcg = callgraph(root, node2id)

    for node in c_nodes:
        c_cg.add_node(node)
        c_dcg.add_node(node)
    for caller, callee, callsite in c_calls:
        c_cg.add_edge((caller,callee,callsite),
                wt=0,label=callsite)
        c_dcg.add_edge((caller,callee,callsite),
                wt=0,label=callsite)

    #if remove_not_visited_node:
    #    utils.remove_not_visited_node(c_cg, args.root)

    return c_cg, c_dcg, node2id
