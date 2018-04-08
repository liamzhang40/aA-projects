require_relative 'board'
require_relative 'display'
require 'byebug'

class Game

  attr_accessor :board, :display

  def initialize
    @board = Board.new
    @display = Display.new(board)
  end

  def run
    puts "Minesweeper!!!"
    until over?
      take_turn
    end
    display.render
    puts board.any_bomb_revealed? ? "You lost!!" : "You won!!"
  end

  def over?
    @board.over?
  end


  def take_turn
    # pos, action = get_move
    # if action == "r"
    #   board[pos].reveal
    #   board.update_board(pos, action)
    # else
    #   board[pos].flag # don't need to update the board because no need to reveal other tiles
    # end
    pos, action = nil, nil
    until pos && action
      display.render
      if pos
        puts "press 'r' to reveal, press 'f' to flag"
        action = display.cursor.get_input
      else
        puts "Which tile"
        pos = display.cursor.get_input
      end
    end

    b[pos].send(action)
    b.update_board(pos, action)

  end

  private
#
#   def get_move
#     puts "Enter a position (ex. 2, 3)"
#     begin
#       pos = parse_pos(gets)
#       board.valid_pos?(pos)
#       puts "Now enter r to 'reveal' and f to 'flag'"
#       action = gets.chomp
#       board.valid_action?(action, pos)
#     rescue ArgumentError => e
#       puts e.message
#       puts "Enter a new position"
#       retry
#     end
#     [pos, action]
#   end
#
#   def parse_pos(string)
#     string.chomp.split(',').map(&:to_i)
#   end
end


game = Game.new.run
