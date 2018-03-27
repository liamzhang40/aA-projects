require_relative 'tile'

class Board

  attr_reader :grid

  def self.from_file
    puts "What is the file name?"
    filename = gets.chomp
    Board.new(filename)
  end

  def initialize(filename)
    @grid = create_grid(filename)
  end

  def render
    puts " -----------------------------------"
    grid.each do |row|
      print "| "
      display_row(row)
      puts "\n -----------------------------------"
    end
  end

  def valid_move?(pos, value)
    
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, tile)
    row, col = pos
    grid
    @grid[row][col] = tile
  end

  def solved?
    grid.flatten.none? {|tile| tile.value == 0}
  end

  private

  def create_grid(filename)
    raw_grid = []
    File.readlines(filename).each do |row|
      raw_grid << row.chomp.split("")
    end
    raw_grid.length.times do |i|
      raw_grid.length.times do |j|
        raw_grid[i][j] = Tile.new([i, j], raw_grid[i][j].to_i)
      end
    end
    raw_grid
  end

  # def update_tile(pos)
  #   self[pos].value =
  # end

  def display_row(row)
    row.each do |tile|
      print (tile.value == 0 ? " " : tile.value)
      print " | "
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Board.from_file.render
end
