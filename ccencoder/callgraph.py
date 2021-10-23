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

class callgraph(basegraph, labeling):

    DIRECTED = True

    def __init__(self, root):
        """
        Initialize a digraph.
        """
        labeling.__init__(self)
        # Pairing: Node -> Neighbors [(neighbor, callsite), ...]
        self.node_neighbors = {}
        # Pairing: Node -> Incident nodes [ incident, callsite), ...]
        self.node_incidence = {}
        self.root = root

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
        tail, head, callsite = edge
        return (tail, head, callsite) in self.edge_properties


    def node_order(self, node):
        """
        Return the order of the given node.

        @rtype:  number
        @return: Order of the given node.
        """
        return len(self.neighbors(node))

class pccegraph(callgraph):

    def __init__(self, root):
        """
        Initialize a PCCEObj.
        """
        callgraph.__init__(self, root)
        self.numCC = {}
        self.visited = {}
        self.stack = []
        self.edgeList = []
        self.dummyList = []

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

    def sorted_nodes(self, N, E):
        for tail in N:
            self.visited[tail] = False

        for tail in N:
            if tail != self.root:
                continue
            else:
                if self.visited[tail] == False: 
                    self.topoSort(tail, self.visited, self.stack)
                    ### for dummy
                    self.edgeList.append(tail)
                    ####
        return self.stack[::-1]

    def topoSort(self, n, visited, stack):
        self.visited[n] = True
        for head, callsite in self.neighbors(n):
            if self.visited[head] == False:
                print("caller: %s -> callee: %s" %(n, head))
                self.topoSort(head, self.visited, self.stack)
            ### for dummy
            elif head in self.edgeList:
                self.dummyList.append([n, head, callsite])
            ####
                

        self.stack.append(n)
        
