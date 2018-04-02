require 'colorize'

class Piece
  attr_accessor :pos
  attr_reader :color, :board

  def initialize(pos, color, board)
    @pos = pos
    @color = color.to_sym
    @board = board
  end

  def to_s
    symbol.colorize(color)
  end

  def empty?
    @color.nil?# if it is a Nullpiece on the position
  end

  def valid_moves
    moves# return all valid moves for each piece
  end

  def pos=(val)
    @pos = val# assign new position to a piece
  end

  def symbol
    "P"
  end

  private

  def move_into_check?(end_pos)

  end


end
