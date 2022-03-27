
require_relative 'node.rb'
require_relative 'graph.rb'
require 'colorize'


class Board

  attr_accessor :board, :node, :graph

  def initialize
    @board = Array.new(8) {Array.new(8)}
  end


  def knight_to_space(d_coord=[7,6], c_coord =[6,0], started=false, queue=[], visited=[], hash={})
    return if !c_coord[0].between?(0,7) || !c_coord[1].between?(0,7)
    return c_coord if d_coord == c_coord
    counter = 0

    if !started
      queue << c_coord
    end
    popped = queue.pop
    
    row = [2, 2, -2, -2, 1, 1, -1, -1]
    column = [-1, 1, 1, -1, 2, -2, 2, -2]

    i= 0
    until i == row.length-1 do
      new_space = [(popped[0] + row[i]), (popped[1] + column[i])]

      if new_space[0].between?(0,7) && new_space[1].between?(0,7) && !visited.include?(new_space)
        queue.unshift(new_space) 
        visited << new_space
      end
      i += 1
    end
    
    knight_to_space(d_coord, c_coord=popped, true, queue, visited, hash)
  end
end

game_board = Board.new

game_board.knight_to_space
