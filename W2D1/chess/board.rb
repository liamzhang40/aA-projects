require_relative "piece"
require_relative "nullpiece"
require "byebug"

class Board
attr_reader :grid

  def set_up(raw_grid)
    (0..1).each do |i|
      (0..7).each do |j|
        raw_grid[i][j] = Piece.new([i,j])
      end
    end

    (2..5).each do |i|
      (0..7).each do |j|
        raw_grid[i][j] = NullPiece.new([i,j])
      end
    end

    (6..7).each do |i|
      (0..7).each do |j|
        raw_grid[i][j] = Piece.new([i,j])
      end
    end

    raw_grid
  end


  def initialize
    @grid = set_up(Array.new(8) {Array.new(8)})
  end

  def move_piece(start_pos, end_pos)
    # begin
    raise "no piece at start position" unless self[start_pos]
    # rescue StandardError => e
    #   puts e.message
    # end
    raise "piece cannot move to end position" if self[end_pos]
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = nil

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
