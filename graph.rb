class Graph

  attr_accessor :nodes
  
  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def add_edge(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    @nodes[node2].add_edge(@nodes[node1])
  end
end

graph = Graph.new

graph.add_node(Node.new([6,0]))
p graph.nodes[[6,0]]