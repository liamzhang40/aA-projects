require_relative 'cursor'
require_relative 'board'
require 'colorize'
require 'byebug'

class Display

  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    system('clear')
    puts "    #{(0...board.grid.length).to_a.join("   ")}"
    puts "   -----------------------------------"

    board.grid.each_with_index do |row, i|
      row_to_s = row.map.with_index do |tile, j|
        # debugger
        if cursor.cursor_pos == [i, j]
          tile.to_s.colorize(:background => :green)
        else
          tile.to_s
        end
      end
      puts "#{i} | #{row_to_s.join(" | ")} |"
      puts "   -----------------------------------"
    end

  end
end


# b = Board.new
# display = Display.new(b)
#
# until b.over?
#   pos = nil
#   action = nil
#   until pos && action
#     display.render
#     if pos
#       puts "press 'r' to reveal, press 'f' to flag"
#       action = display.cursor.get_input
#     else
#       puts "Which tile"
#       pos = display.cursor.get_input
#     end
#   end
#
#   b[pos].send(action)
#
#   b.update_board(pos, action)
# end
# display.render
