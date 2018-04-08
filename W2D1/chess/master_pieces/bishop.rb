require_relative 'piece'
require_relative 'slideable'

# #comment in for test case
# require_relative 'board'
# require_relative 'display'

class Bishop < Piece

  include Slideable

  def initialize(pos, color, board)
    super
  end

  def symbol
    "♝"
  end

  protected

  def move_dirs
    diagonal_dirs
  end

end

# #comment in for test case
# b = Board.new
# bi = Bishop.new([3, 0], "red", b)
# b[[3, 0]] = bi
# display = Display.new(b)
# display.render
#
# p bi.moves
