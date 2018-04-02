require_relative "cursor"
require_relative "board"
require 'byebug'
require "colorize"

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    puts " -------------------------------"
    board.grid.each_with_index do |row, i|
      row_to_display = row.map.with_index do |piece, j|
        # if cursor position is on a NullPiece, it displays colorized background of an empty string " "
        if [i, j] == cursor.cursor_pos && board[[i, j]].is_a?(NullPiece)
          cursor.selected ? piece.to_s.colorize(:background => :green) : piece.to_s.colorize(:background => :light_green)
        # if cursor position is on a Piece, display piece symbol and colorized background of that symbol
        elsif piece.pos == cursor.cursor_pos
          cursor.selected ? piece.to_s.colorize(:background => :green) : piece.to_s.colorize(:background => :light_green)
        elsif [i, j].all?(&:odd?) || [i, j].all?(&:even?)
          piece.to_s.colorize(:background => :white)
        else
          piece.to_s.colorize(:background => :yellow)
        end
      end

      puts "| #{row_to_display.join(' | ')} |"
      puts " -------------------------------"
    end
    puts " "
  end
end

#
b = Board.new

display = Display.new(b)
# p b[[1, 6]].moves

while true
  system('clear')
  display.render
  display.cursor.get_input
  if display.cursor.selected
    p display.cursor.cursor_pos
  end
  if display.cursor.selected
    p selected_end_pos = display.cursor.cursor_pos
    # b.move_piece(:white, selected_start_pos, selected_end_pos)
  end
end
