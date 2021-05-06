class Knight
  attr_accessor :position, :children, :previous, :history

  MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze

  def initialize(position, previous = nil)
    @position = position
    @previous = previous
    @children = []
  end

  def making_moves
    MOVES.map { |move| [position[0] + move[0], position[1] + move[1]] }
         .reject { |elem| valid_move?(elem) }
  end

  def valid_move?(elem)
    elem[0] > 7 || elem[0].negative? || elem[1] > 7 || elem[1].negative? || elem[0].nil? || elem[1].nil?
  end
end
