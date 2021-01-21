#!/bin/python
import sys
import os
import os.path
import pygraph.readwrite.dot
from sets import Set

def remove_backedge(g, main_node = None):
    def dfs(g, p, visited, call_stack):

        call_stack.add(p)
        visited[p] = True

        for n in g.neighbors(p):
            if n in call_stack:
                g.del_edge((p,n))

            if not visited[n]:
                dfs(g, n, visited, call_stack)

        call_stack.remove(p)

    # body of remove_backedge
    visited = {}
    call_stack = Set()
    for n in g.nodes():
        visited[n] = False

    if main_node == None:
        main_node = g.get_main_node('{main|')

    dfs(g, main_node, visited, call_stack)

def topological_sort(g, main_node = None):
    def dfs(g, p, visited, stack):
        visited[p] = True

        for n in g.neighbors(p):
            if not visited[n]:
                dfs(g, n, visited, stack)

        stack.insert(0, p)

    # body of topological_sort
    visited = {}
    for p in g.nodes():
        visited[p] = False
    stack = []

    if main_node == None:
        main_node = g.get_main_node('{main|')

    dfs(g, main_node, visited, stack)
    return stack

# calulate number of paths from single source to all nodes
# dfs with stack
def num_ss_allpaths(g, inf, fout, main_node = None):
    def dfs(p, cur_path):
        new_path = cur_path
        new_path += '->' + p
        if new_path not in paths[p]:
            paths[p].append(new_path)

        for n in g.neighbors(p):
            dfs(n, new_path)
    
    def dfs_stack(p):

        stack = []
        stack.append((p, ''))

        max_id = 0

        while (len(stack)):
            p, cur_path = stack[-1]
            stack.pop()

            new_path = cur_path
            new_path += '->' + p 
            if new_path not in paths[p]:
                paths[p].append(new_path)
                max_id += 1

                #[623.xalancbmk_s.dot]   MaxID: 18,272,967,847,292
                if max_id % 1000 == 0:
                    fout.write('[%s] max_id: %d\n' % (inf, max_id))
                    fout.flush()

            for n in g.neighbors(p):
                stack.append((n, new_path))

    if main_node == None:
        main_node = g.get_main_node('{main|')

    paths = {}
    for n in g.nodes():
        paths[n] = []
    dfs_stack(main_node)
    return paths


# calulate number of paths from single source to all nodes
# bfs
def num_ss_allpaths2(g, inf, fout, main_node = None):
    
    def bfs():
        queue = []
        queue.append(main_node)

        while (queue != []):
            v = queue.pop(0)
            fout.write('visiting %s\n' % (v))

            for n in g.neighbors(v):
                max_ids[n] += max_ids[v]
                if not visited[n]:
                    visited[n] = True
                    queue.append(n)
    visited = {}
    max_ids = {}
    for n in g.nodes():
        max_ids[n] = 0
        visited[n] = False
    max_ids[main_node] = 1

    bfs()

    print(max_ids)

    MaxID = 0
    for n, ids in max_ids.iteritems():
        MaxID += ids

    return MaxID

                


#def num_ss_allpaths(g, main_node = None):
#
#    def bfs():
#        queue.append(main_node)
#        while (queue != []):
#            v = queue.pop(0)
#            # do something with v
#            print("visiting %s" % v)
#            for n in g.incidents(v):
#                print('  %s->%s' % (n,v))
#
#            for w in g.neighbors(v):
#                if not visited[w]:
#                    visited[w] = True
#                    queue.append(w)
#
#    num_paths = {}
#    visited = {}
#    queue = []
#    for n in g.nodes():
#        num_paths[n] = 1
#        visited[n] = False
#    bfs()
