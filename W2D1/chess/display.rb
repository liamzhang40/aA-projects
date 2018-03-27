require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    puts " -------------------------------"
    board.grid.each do |row|
      row_to_display = row.map do |piece|
        unless piece.pos == cursor.cursor_pos
          piece.to_s
        else
          piece.to_s.colorize(:background => :green)
        end
      end

      puts "| #{row_to_display.join(' | ')} |"
      puts " -------------------------------"
    end
    puts " "
  end
end


b = Board.new

display = Display.new(b)

while true
  system('clear')
  display.render
  display.cursor.get_input
end
