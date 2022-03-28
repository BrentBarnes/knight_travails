class Node

  attr_reader :value, :adjacent_nodes, :previous, :dist

  def initialize(value)
    @value = value
    @adjacent_nodes = []
    @previous = nil
    @dist = 0
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end

  def add_previous(previous_node)
    @previous = previous_node
  end

  def add_dist(distance)
    @dist = (previous.dist + distance)
  end

  def print_path(node)
    return if node.previous.nil?
    
    print_path(node.previous)
    to_square(node.previous.value)
    if node.adjacent_nodes.empty? then to_square(node.value) end
  end

  def to_square(coordinate)
    column = (coordinate[0] + 97).chr
    row = (coordinate[1] + 1).to_s
    puts column + row
  end

  def find_shortest_path(root_node, desired_coord, started=false, visited=[], queue=[])
    return puts 'queue is empty' if started && queue.empty?
    return puts "not valid" if !root_node.value[0].between?(0,7) && !root_node.value[1].between?(0,7)

    if !started
      visited << root_node.value
      queue << root_node.value
      started = true
    end
    
    row = [2, 2, -2, -2, 1, 1, -1, -1]
    column = [-1, 1, 1, -1, 2, -2, 2, -2]

    if root_node.value != desired_coord
      queue.shift
      i= 0
      until i == row.length-1 do
        new_space = Node.new([(root_node.value[0] + row[i]), (root_node.value[1] + column[i])])
  
        if new_space.value[0].between?(0,7) && new_space.value[1].between?(0,7) && !visited.include?(new_space.value)
          new_space.add_previous(root_node)
          new_space.add_dist(1)
          root_node.add_edge(new_space.value)
          queue << new_space
          visited << new_space.value
        end
        i += 1
      end
      find_shortest_path(queue[0], desired_coord, true, visited, queue)
    else
      puts "You made it in #{root_node.dist} moves! Here is your path."
      print_path(root_node)
    end
  end
end

node = Node.new([0,0])

node.find_shortest_path(node, [5, 6])