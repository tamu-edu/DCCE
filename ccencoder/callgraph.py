# https://github.com/pmatiello/python-graph
# Copyright (c) 2008-2009 Pedro Matiello <pmatiello@gmail.com>
#                         Salim Fadhley <sal@stodge.org>
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

class basegraph( object ):
    """
    An abstract class intended as a common ancestor to all graph classes.
    This allows the user to test isinstance(X, basegraph) to determine
    if the object is one of any of the python-graph
    main classes.
    """

class labeling( object ):
    """
    Generic labeling support for graphs

    @sort: __eq__, __init__, add_edge_attribute, add_edge_attributes,
    add_node_attribute, del_edge_labeling, del_node_labeling,
    edge_attributes, edge_label, edge_weight,
    get_edge_properties, node_attributes, set_edge_label,
    set_edge_properties, set_edge_weight
    """
    WEIGHT_ATTRIBUTE_NAME = "weight"
    DEFAULT_WEIGHT = 1

    LABEL_ATTRIBUTE_NAME = "label"
    DEFAULT_LABEL = ""

    def __init__(self):
        # Metadata bout edges
        # Mapping: Edge -> Dict mapping, label-> str, wt->num
        self.edge_properties = {}
        # Key value pairs: (Edge -> Attributes)
        self.edge_attr = {}

        # Metadata bout nodes
        # Pairing: Node -> Attributes
        self.node_attr = {}

    def del_node_labeling( self, node ):
        if node in self.node_attr:
            # Since attributes and properties are lazy, they might not exist.
            del( self.node_attr[node] )

    def del_edge_labeling( self, edge ):

        keys = [edge]
        if not self.DIRECTED:
            keys.append(edge[::-1])

        for key in keys:
            for mapping in [self.edge_properties, self.edge_attr ]:
                try:
                    del ( mapping[key] )
                except KeyError:
                    pass

    def edge_weight(self, edge):
        """
        Get the weight of an edge.

        @type  edge: edge
        @param edge: One edge.

        @rtype:  number
        @return: Edge weight.
        """
        return self.get_edge_properties( \
                edge ).setdefault( \
                self.WEIGHT_ATTRIBUTE_NAME, self.DEFAULT_WEIGHT )


    def set_edge_weight(self, edge, wt):
        """
        Set the weight of an edge.

        @type  edge: edge
        @param edge: One edge.

        @type  wt: number
        @param wt: Edge weight.
        """
        self.set_edge_properties(edge, weight=wt )
        if not self.DIRECTED:
            self.set_edge_properties((edge[1], edge[0]) , weight=wt )


    def edge_label(self, edge):
        """
        Get the label of an edge.

        @type  edge: edge
        @param edge: One edge.

        @rtype:  string
        @return: Edge label
        """
        return self.get_edge_properties( \
                edge ).setdefault( \
                self.LABEL_ATTRIBUTE_NAME, self.DEFAULT_LABEL )

    def set_edge_label(self, edge, label):
        """
        Set the label of an edge.

        @type  edge: edge
        @param edge: One edge.

        @type  label: string
        @param label: Edge label.
        """
        self.set_edge_properties(edge, label=label )
        if not self.DIRECTED:
            self.set_edge_properties((edge[1], edge[0]) , label=label )

    def set_edge_properties(self, edge, **properties ):
        self.edge_properties.setdefault( edge, {} ).update( properties )
        if (not self.DIRECTED and edge[0] != edge[1]):
            self.edge_properties.setdefault(\
                    (edge[1], edge[0]), {}).update( properties )

    def get_edge_properties(self, edge):
        return self.edge_properties.setdefault( edge, {} )

    def add_edge_attribute(self, edge, attr):
        """
        Add attribute to the given edge.

        @type  edge: edge
        @param edge: One edge.

        @type  attr: tuple
        @param attr: Node attribute specified as a tuple
                     in the form (attribute, value).
        """
        self.edge_attr[edge] = self.edge_attributes(edge) + [attr]

        if (not self.DIRECTED and edge[0] != edge[1]):
            self.edge_attr[(edge[1],edge[0])] = \
                    self.edge_attributes((edge[1], edge[0])) + [attr]

    def add_edge_attributes(self, edge, attrs):
        """
        Append a sequence of attributes to the given edge

        @type  edge: edge
        @param edge: One edge.

        @type  attrs: tuple
        @param attrs: Node attributes specified as a sequence of
                      tuples in the form (attribute, value).
        """
        for attr in attrs:
            self.add_edge_attribute(edge, attr)


    def add_node_attribute(self, node, attr):
        """
        Add attribute to the given node.

        @type  node: node
        @param node: Node identifier

        @type  attr: tuple
        @param attr: Node attribute specified as a tuple
                     in the form (attribute, value).
        """
        self.node_attr[node] = self.node_attr[node] + [attr]


    def node_attributes(self, node):
        """
        Return the attributes of the given node.

        @type  node: node
        @param node: Node identifier

        @rtype:  list
        @return: List of attributes specified tuples
                 in the form (attribute, value).
        """
        return self.node_attr[node]


    def edge_attributes(self, edge):
        """
        Return the attributes of the given edge.

        @type  edge: edge
        @param edge: One edge.

        @rtype:  list
        @return: List of attributes specified tuples
                 in the form (attribute, value).
        """
        try:
            return self.edge_attr[edge]
        except KeyError:
            return []

    def __eq__(self, other):
        """
        Return whether this graph is equal to another one.

        @type other: graph, digraph
        @param other: Other graph or digraph

        @rtype: boolean
        @return: Whether this graph and the other are equal.
        """
        def attrs_eq(list1, list2):
            for each in list1:
                if (each not in list2): return False
            for each in list2:
                if (each not in list1): return False
            return True

        def edges_eq():
            for edge in self.edges():
                if (self.edge_weight(edge) != other.edge_weight(edge)):
                    return False
                if (self.edge_label(edge) != other.edge_label(edge)):
                    return False
                if (not attrs_eq(self.edge_attributes(edge), \
                        other.edge_attributes(edge))):
                    return False
            return True

        def nodes_eq():
            for node in self:
                if (not attrs_eq(self.node_attributes(node), \
                        other.node_attributes(node))):
                    return False
            return True

        return nodes_eq() and edges_eq()

class common( object ):
    """
    Standard methods common to all graph classes.
    
    @sort: __eq__, __getitem__, __iter__, __len__, __repr__, __str__, add_graph, add_nodes,
    add_spanning_tree, complete, inverse, order, reverse
    """
    
    def __str__(self):
        """
        Return a string representing the graph when requested by str() (or print).

        @rtype:  string
        @return: String representing the graph.
        """
        str_nodes = repr( self.nodes() )
        str_edges = repr( self.edges() )
        return "%s %s" % ( str_nodes, str_edges )

    def __repr__(self):
        """
        Return a string representing the graph when requested by repr()

        @rtype:  string
        @return: String representing the graph.
        """
        return "<%s.%s %s>" % ( self.__class__.__module__, self.__class__.__name__, str(self) )
    
    def __iter__(self):
        """
        Return a iterator passing through all nodes in the graph.
        
        @rtype:  iterator
        @return: Iterator passing through all nodes in the graph.
        """
        for n in self.nodes():
            yield n
            
    def __len__(self):
        """
        Return the order of self when requested by len().

        @rtype:  number
        @return: Size of the graph.
        """
        return self.order()
    
    def __getitem__(self, node):
        """
        Return a iterator passing through all neighbors of the given node.
        
        @rtype:  iterator
        @return: Iterator passing through all neighbors of the given node.
        """
        for n in self.neighbors( node ):
            yield n
            
    def order(self):
        """
        Return the order of self, this is defined as the number of nodes in the graph.

        @rtype:  number
        @return: Size of the graph.
        """
        return len(self.nodes())
            
            
    def __eq__(self, other):
        """
        Return whether this graph is equal to another one.
        
        @type other: graph, digraph
        @param other: Other graph or digraph
        
        @rtype: boolean
        @return: Whether this graph and the other are equal.
        """
        
        def nodes_eq():
            for each in self:
                if (not other.has_node(each)): return False
            for each in other:
                if (not self.has_node(each)): return False
            return True
        
        def edges_eq():
            for edge in self.edges():
                if (not other.has_edge(edge)): return False
            for edge in other.edges():
                if (not self.has_edge(edge)): return False
            return True
        
        try:
            return nodes_eq() and edges_eq()
        except AttributeError:
            return False


class callgraph(basegraph, common, labeling):

    DIRECTED = True

    def __init__(self, root, node2id):
        """
        Initialize a digraph.
        """
        labeling.__init__(self)
        # Pairing: Node -> Neighbors [(neighbor, callsite), ...]
        self.node_neighbors = {}
        # Pairing: Node -> Incident nodes [ incident, callsite), ...]
        self.node_incidence = {}
        self.root = root
        self.node2id = node2id

    def get_root(self):
        return self.root
    def nodes(self):
        """
        Return node list.

        @rtype:  list
        @return: Node list.
        """
        return list(self.node_neighbors.keys())


    def neighbors(self, node):
        """
        Return all nodes that are directly accessible from given node.

        @type  node: node
        @param node: Node identifier

        @rtype:  list
        @return: List of nodes directly accessible from given node.
        """
        return self.node_neighbors[node]


    def incidents(self, node):
        """
        Return all nodes that are incident to the given node.

        @type  node: node
        @param node: Node identifier

        @rtype:  list
        @return: List of nodes directly accessible from given node.
        """
        return self.node_incidence[node]

    def edges(self):
        """
        Return all edges in the graph.

        @rtype:  list
        @return: List of all edges in the graph.
        """
        return [ a for a in self._edges() ]

    def _edges(self):
        for n, neighbors in self.node_neighbors.items():
            for neighbor in neighbors:
                yield (n, neighbor)

    def has_node(self, node):
        """
        Return whether the requested node exists.

        @type  node: node
        @param node: Node identifier

        @rtype:  boolean
        @return: Truth-value for node existence.
        """
        return node in self.node_neighbors

    def add_node(self, node, attrs = None):
        """
        Add given node to the graph.

        @attention: While nodes can be of any type,
        it's strongly recommended to use only numbers and single-line
        strings as node identifiers if you intend to use write().

        @type  node: node
        @param node: Node identifier.

        @type  attrs: list
        @param attrs: List of node attributes
        specified as (attribute, value) tuples.
        """
        if attrs is None:
            attrs = []
        if (node not in self.node_neighbors):
            self.node_neighbors[node] = []
            self.node_incidence[node] = []
            self.node_attr[node] = attrs
        else:
            raise AdditionError("Node %s already in digraph" % node)


    def add_edge(self, edge, wt = 0, maxid = 0, label="", attrs = []):
        """
        Add an directed edge to the graph connecting two nodes.

        An edge, here, is a triple like C{(tail, head, callsite)}.
        @type edge: tripple
        @param edge: Edge.

        @type wt: number
        @param wt: a number that will be added to MaxID

        @type  label: string
        @param label: Edge label.

        @type  attrs: list
        @param attrs: List of node attributes
        specified as (attribute, value) tuples.
        """
        tail, head, callsite = edge
        for n in [tail,head]:
            if not n in self.node_neighbors:
                raise AdditionError( \
                        "%s is missing from the node_neighbors table" % n )
            if not n in self.node_incidence:
                raise AdditionError( \
                        "%s is missing from the node_incidence table" % n )

        if head in self.node_neighbors[tail] and tail \
                in self.node_incidence[head]:
            raise AdditionError(\
                    "Edge (%s, %s) already in digraph" % (u, v))
        else:
            self.node_neighbors[tail].append((head, callsite))
            self.node_incidence[head].append((tail, callsite))
            self.set_edge_weight((tail, head, callsite), wt)
            self.add_edge_attributes( \
                    (tail, head, callsite), attrs )
            self.set_edge_properties( \
                    (tail, head, callsite), label=label, weight=wt )


    def del_node(self, node):
        """
        Remove a node from the graph.

        @type  node: node
        @param node: Node identifier.
        """
        for each, cs in list(self.incidents(node)):
            # Delete all the edges incident on this node
            self.del_edge((each, node, cs))

        for each, cs in list(self.neighbors(node)):
            # Delete all the edges pointing to this node.
            self.del_edge((node, each, cs))

        # Remove this node from the neighbors and incidents tables
        del(self.node_neighbors[node])
        del(self.node_incidence[node])

        # Remove any labeling which may exist.
        self.del_node_labeling( node )


    def del_edge(self, edge):
        """
        Remove an directed edge from the graph.

        @type  edge: triple
        @param edge: Edge.
        """
        tail, head, callsite = edge
        self.node_neighbors[tail].remove((head, callsite))
        self.node_incidence[head].remove((tail, callsite))
        self.del_edge_labeling( (tail,head, callsite) )


    def has_edge(self, edge):
        """
        Return whether an edge exists.

        @type  edge: triple
        @param edge: Edge.

        @rtype:  boolean
        @return: Truth-value for edge existence.
        """
        tail, (head, callsite) = edge
        return (tail, head, callsite) in self.edge_properties


    def node_order(self, node):
        """
        Return the order of the given node.

        @rtype:  number
        @return: Order of the given node.
        """
        return len(self.neighbors(node))

    def isBackEdge(self, e):
        p, n, l = e
        for u, v, cs in self.getBackEdges():
            if (p == u) and (n == v) and (l == cs):
                return True
        return False

    def getBackEdges(self):
        try:
            return self.back_edges
        except AttributeError:
            self.visited = {}
            self.start_time = {}
            self.end_time = {}
            self.back_edges = []
            self.time = 0

            for n in self.nodes():
                self.visited[n] = False
                self.start_time[n] = 0
                self.end_time[n] = 0

            self.__getBackEdges(self.root)
            return self.back_edges

    def __getBackEdges(self, u):
        self.visited[u] = True
        self.start_time[u] = self.time
        self.time += 1
        #print(f'Visiting {u} {self.start_time[u]}/{self.end_time[u]}')

        # edge (u,v)
        for v, cs in self.neighbors(u):
            if not self.visited[v]:
                # Tree Edge
                #print('Tree Edge:', str(u)+'-->'+str(v))
                self.__getBackEdges(v)
            else:
                #print(f'Checking {u}({self.start_time[u]}/{self.end_time[u]})-->{v}({self.start_time[v]}/{self.end_time[v]}) ')

                # Back Edge: It is an edge (u,v) such that v is an ancestor of node u but not part of DFS tree.
                if self.start_time[u] > self.start_time[v] and self.end_time[v] == 0: 
                    print('Back Edge:', str(u)+'-->'+str(v))
                    self.back_edges.append((u, v, cs))
                elif self.start_time[u] < self.start_time[v] and self.end_time[u] == 0:
                    pass
                    #print('Forward Edge:', str(u)+'-->'+str(v))
                elif self.start_time[u] > self.start_time[v] and self.end_time[v] > 0:
                    pass
                    #print('Cross Edge:', str(u)+'-->'+str(v))
                else:
                    print('Unkwnon Type of Edge', str(u)+'-->'+str(v))
            #print(f'Update end_time at {u} <-- {self.time}')
            #self.end_time[u] = self.time
        #print(f'Finished {u} at {self.time}')
        self.end_time[u] = self.time
        self.time += 1


    def print_graph(self, msg):
        print(f'---------------------------------')
        print(f'Print graph {msg}')
        print(f'---------------------------------')
        for u in self.nodes():
            for v, cs in self.neighbors(u):
                wt = self.edge_weight((u,v,cs))
                print(f'{u}:{v}:{cs}')

    def get_node_with_max_neighbors(self):
        max_neighbors = 0
        node_with_max_neighbors = ''
        for n in self.nodes():
            num_neighbors = len(self.neighbors(n)) 
            if num_neighbors > max_neighbors:
                max_neighbors = num_neighbors
                node_with_max_neighbors = n
        return node_with_max_neighbors, max_neighbors
            
    def get_node_with_max_incidents(self):
        max_incidents = 0
        node_with_max_incidents = ''
        for n in self.nodes():
            num_incidents = len(self.incidents(n)) 
            if num_incidents > max_incidents:
                max_incidents = num_incidents
                node_with_max_incidents = n
        return node_with_max_incidents, max_incidents

    def __eq__(self, other):
        return common.__eq__(self, other) and labeling.__eq__(self, other)


class pccegraph(callgraph):

    def __init__(self, root, node2id):
        """
        Initialize a PCCEObj.
        """
        callgraph.__init__(self, root, node2id)
        self.numCC = {}
        self.dummyNode = 'dummy-main'
        self.dummyEdge = 'dummy-edge'
        self.dummyEdgeID = 0

    def add_node(self, n):
        callgraph.add_node(self, n)
        if (self.root == n):
            self.numCC[n] = 1
        else:
            self.numCC[n] = 0

    def getnumCC(self, n):
        return self.numCC[n]

    def setnumCC(self, n, p):
        if n == self.root:
            self.numCC[n] = 1
        else:
            self.numCC[n] = self.getnumCC(n) + self.getnumCC(p)
        return self.numCC[n]

    def sorted_nodes(self):
        visited = {}
        stack = []
        for tail in self.nodes():
            visited[tail] = False

        self.topoSort(self.root, visited, stack)
        print(f'TopoSort: {stack[::-1]}')
        return stack[::-1]

    def topoSort(self, n, visited, stack):
        visited[n] = True
        for head, callsite in self.neighbors(n):
            if visited[head] == False:
                self.topoSort(head, visited, stack)
        stack.append(n)

    def getNextDummyEdge(self):
        newDummyEdge = self.dummyEdge + str(self.dummyEdgeID)
        self.dummyEdgeID += 1
        return newDummyEdge

    def addDummy(self):
        self.add_node(self.dummyNode)
        self.add_edge((self.dummyNode, self.root, self.getNextDummyEdge()))
        self.numCC[self.root] = 0
        self.root = self.dummyNode
        self.numCC[self.root] = 1

    def transform(self, edge):
        u, v, cs = edge
        # Get rid of edge from the graph
        # Connect edge from dummy to v
        self.del_edge(edge)
        self.add_edge((self.dummyNode, v, self.getNextDummyEdge()))

    def hasDummyEdge(self, v):
        """Check if n has a dummy edge """
        for u, cs in self.incidents(v):
            #print(f'hasDummyEdge {u}--{cs}-->{v}')
            if self.dummyEdge in cs:
                return True
        return False

    def isDummyNode(self, n):
        return n == self.dummyNode
