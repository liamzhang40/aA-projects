require_relative 'piece'
require_relative 'slideable'

# #comment in for test case
# require_relative 'board'
# require_relative 'display'

class Queen < Piece

  include Slideable

  def initialize(pos, color, board)
    super
  end

  def symbol
    "Q"
  end

protected

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end

# #comment in for test case
# b = Board.new
# q = Queen.new([3, 0], "red", b)
# b[[3, 0]] = q
# display = Display.new(b)
# display.render
#
# p q.moves
