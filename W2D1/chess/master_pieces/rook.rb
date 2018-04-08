require_relative 'piece'
require_relative 'slideable'

# #comment in for test case
# require_relative 'board'
# require_relative 'display'

class Rook < Piece

  include Slideable

  def initialize(pos, color, board)
    super
  end

  def symbol
    "♜"
  end

  protected

  def move_dirs
    horizontal_dirs
  end

end

# # comment in for test case
# b = Board.new
# r = Rook.new([4, 4], "black", b)
# b[[4, 4]] = r
# display = Display.new(b)
# display.render
#
# p r.moves
