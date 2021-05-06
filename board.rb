# write a program that gets a knight from a starting position to an ending position in the shortest path possible (BFS)
# use an algorithem to achieve this

# a knight should be initialized with a position, track its children, and track its previous move.

class Knight
  attr_accessor :position, :previous, :children

  def initialize(position, previous = nil)
    @position = position
    @previous = previous
    @children = []
  end

  def possible_moves
    result = []
    moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze

    moves.each do |move|
      x = @position[0] + move[0]
      y = @position[1] + move[1]
      result << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    result
  end
end

class Board

  def knight_moves(start_pos, end_pos)
    current_node = tree(start_pos, end_pos)
    history = []
    track_history(history, current_node, start_pos)
    print_history(history, start_pos, end_pos)
  end

  def tree(start_pos, end_pos)
    queue = [Knight.new(start_pos)]
    current_node = queue.shift
    until current_node.position == end_pos
      current_node.possible_moves.each do |move|
        knight = Knight.new(move, current_node)
        current_node.children << knight
        queue << knight
      end
      current_node = queue.shift
    end
    current_node
  end

  def track_history(history, current_node, start_pos)
    until current_node.position == start_pos
      history << current_node.position
      current_node = current_node.previous
    end
    history << current_node.position
  end

  def print_history(history)
    puts "You made it in #{history.length - 1} moves! Here's your path:"
    history.reverse.each { |move| puts move.to_s }
  end
end

board = Board.new
board.knight_moves([3, 3], [4, 3])
