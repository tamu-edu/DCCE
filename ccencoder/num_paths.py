import sys
import os
import os.path
import argparse
import utils


benches = [
    '600.perlbench_s', # cannot run instrument because of integer overflow
    #'602.gcc_s',      # compile issue
    '605.mcf_s',
    #'607.cactuBSSN_s',# compile issue
    '619.lbm_s',
    '620.omnetpp_s',  # assertion during dump-callgraph lineno: 356
    '623.xalancbmk_s',# assertion during dump-callgraph lineno: 356
    '625.x264_s',
    '631.deepsjeng_s',
    '638.imagick_s',
    '641.leela_s',   # assertion during dump-callgraph lineno: 356
    '644.nab_s',
    '657.xz_s',
    '998.specrand_is',
    '100.test',
    ]

output_root = '../output/dcce/ccenc/'

dag= {}

def add_edge(a, b, incidents):
    if a not in dag:
        dag[a] = []
    dag[a].append(b)
    incidents[b] += 1


def topological_sort(incidents, n):
    q = []

    for i in range(n):
        if not incidents[i]:
            q.append(i)

    l = []
    while not (not q):
        u = q.pop(0)

        l.append(u)

        for ii in range(len(dag[u])):
            incidents[dag[u][ii]] -= 1

            if not incidents[dag[u][ii]]:
                q.append(dag[u][ii])


    return l;

def numberofPaths(src, dest, n, incidents):
    """""""""""""""""""""""""""""""""""""""""""""""""""
    dag         : adjacency matrix of DAG 
    n           : number of nodes in DAG
    incidents   : nid -> #incidents

    DP(u) = the number of paths from u to destination
    DP(dest) = 1, DP(others) = 0
    DP[Ni] = DP[Ni] + DP[Nj]  
        where i is the list of node id that are reverse order of topo sort
              j is the list of neighbor node id
    """""""""""""""""""""""""""""""""""""""""""""""""""
    dincidents = incidents[:]
    sorted = topological_sort(dincidents, n)
    dp = [0 for i in range(n)]

    dp[dest] = 1;
    
    reversedIdx = range(len(sorted))
    reversedIdx.sort(reverse=True)
    # traverse in reverse order
    for i in reversedIdx:
        for j in range(len(dag[sorted[i]])):
            dp[sorted[i]] += dp[dag[sorted[i]][j]]

    return dp[src]


def read_cg(bench):
    file = '%s/%s.cc' % (output_root, bench)
    edges = []
    nodes = set()
    src = None
    max_node_id = 0
    with open(file, 'r') as f:
        for line in f:
            # 1810-Perl_sv_2pvbyte_nolen:1411-Perl_sv_2pvbyte:20139:0
            w = int(line.split(':')[3])
            if w == 0: continue

            caller_id = int(line.split(':')[0].split('-')[0])
            caller_name = line.split(':')[0].split('-')[1]
            callee_id = int(line.split(':')[1].split('-')[0])
            callee_name = line.split(':')[1].split('-')[1]
            edges.append((caller_id, callee_id))
            nodes.add(caller_id)
            nodes.add(callee_id)

            if caller_name == 'main':
                src = caller_id

            if caller_id > max_node_id:
                max_node_id = caller_id
            if callee_id > max_node_id:
                max_node_id = callee_id

    n = max_node_id + 1

    for i in range(n):
        dag[i] = []

    # to count number of vertex which don't
    # have any parents
    incidents = [0 for i in range(n)]

    for caller_id, callee_id in edges:
        #print('add edge %d -> %d' % (caller_id, callee_id))
        add_edge(caller_id, callee_id, incidents)

    return src, n, incidents

def main():
    for bench in benches:
        print('processing %s' % (bench))
        src, n, incidents = read_cg(bench)
  
        f = open('%s.numpath' % (bench), 'w')
        sum_paths = 0
        for i in range(n):
            sum_paths += numberofPaths(src, i, n, incidents)
            f.write('%d -> %d = %d\n' % (src, i, numberofPaths(src, i, n, incidents)))
        f.write('sum_paths: %d\n' % (sum_paths))
        f.close()

    
if __name__== "__main__":
    main()
