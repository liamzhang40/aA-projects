require_relative 'piece'
require_relative 'stepable'

# #comment in for test case
# require_relative 'board'
# require_relative 'display'

class Knight < Piece

  include Stepable

  def initialize(pos, color, board)
    super
  end

  def symbol
    "K"
  end

  protected

  def move_diffs
    knight_diffs
  end

end

# # comment in for test case
# b = Board.new
# k = Knight.new([3, 1], "black", b)
# b[[3, 1]] = k
# display = Display.new(b)
# display.render
#
# p k.moves
