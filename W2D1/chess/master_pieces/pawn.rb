require_relative 'piece'
require 'byebug'

class Pawn < Piece

  def initialize(pos, color, board)
    super
  end

  def symbol
    "♟"
  end

  def move_dirs
    forward_steps + side_attacks
  end

  def moves
    # debugger
    move_dirs.map {|move_dir| [@pos[0] + move_dir[0], @pos[1] + move_dir[1]]}
  end

  private

  def at_start_row?
    return true if @color == :white && @pos[0] == 6
    return true if @color == :black && @pos[0] == 1
  end

  def forward_dir
    return -1 if @color == :white
    return 1 if @color == :black
  end

  def forward_steps
    at_start_row? ? [[forward_dir * 2, 0], [forward_dir, 0]] : [[forward_dir, 0]]
  end

  def side_attacks
    if forward_dir == -1 && board[[pos[0] - 1, pos[1]]].color == :black
      return [[-1, -1], [-1, 1]]
    elsif forward_dir == 1 && board[[pos[0] + 1, pos[1]]].color == :white
      return [[1, -1], [1, 1]]
    end
    []
  end
end
