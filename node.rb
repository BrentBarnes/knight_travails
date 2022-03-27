class Node

  attr_reader :value, :previous

  def initialize(value)
    @value = value
    @adjacent_nodes = []
    @previous = nil
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end

  def add_neighbors(root_node, visited=[], queue=[])

    visited << root_node
    queue << root_node
    
    row = [2, 2, -2, -2, 1, 1, -1, -1]
    column = [-1, 1, 1, -1, 2, -2, 2, -2]

    i= 0
    until i == row.length-1 do
      new_space = Node.new([(root_node[0] + row[i]), (root_node[1] + column[i])])

      if new_space.value[0].between?(0,7) && new_space.value[1].between?(0,7) && !visited.include?(new_space)
        @adjacent_nodes << new_space
        visited << new_space
      end
      i += 1
    end
  # add_neighbors()
    p root_node
  end
end

node = Node.new([0,0])

node.add_neighbors([0,0])
# node.adjacent_nodes