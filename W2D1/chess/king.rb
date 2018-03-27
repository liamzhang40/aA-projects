require_relative 'piece'
require_relative 'stepable'

# #comment in for test case
# require_relative 'board'
# require_relative 'display'

class King < Piece

  include Stepable

  def initialize(pos, color, board)
    super
  end

  def symbol
    "K"
  end

  protected

  def move_diffs
    king_diffs
  end

end

# # comment in for test case
# b = Board.new
# k = King.new([0, 4], "red", b)
# b[[0, 4]] = k
# display = Display.new(b)
# display.render
#
# p k.moves
