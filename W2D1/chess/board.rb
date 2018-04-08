require_relative "master_pieces/master"
require "byebug"

class Board
attr_reader :grid

  def set_up(raw_grid)
    rows_to_create = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    (0..7).each do |j|
      raw_grid[0][j] = rows_to_create[j].new([0,j], "black", self)
    end

    (0..7).each do |j|
      raw_grid[1][j] = Pawn.new([1,j], "black", self)
    end

    (2..5).each do |i|
      (0..7).each do |j|
        raw_grid[i][j] = NullPiece.instance
      end
    end

    (0..7).each do |j|
      raw_grid[6][j] = Pawn.new([6,j], "white", self)
    end

    (0..7).each do |j|
      raw_grid[7][j] = rows_to_create[j].new([7,j], "white", self)
    end

    raw_grid
  end


  def initialize
    @grid = set_up(Array.new(8) {Array.new(8)})
  end

  def move_piece(color, start_pos, end_pos)
    # begin
    raise "no piece at start position" if self[start_pos].is_a? NullPiece
    # rescue StandardError => e
    #   puts e.message
    # end
    raise "piece cannot move to end position" unless self[start_pos].moves.include?(end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def valid_pos?(pos)
    pos.all? {|num| num.between?(0, 7)}
  end

end

# p b = Board.new
# b.move_piece([0,0],[2,0])
# p b
