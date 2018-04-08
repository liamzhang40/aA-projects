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
      # debugger
      take_turn
    end
    print_result
  end
  
  private

  def over?
    @board.over?
  end

  def print_result
    display.render
    puts board.any_bomb_revealed? ? "You lost!!" : "You won!!"
  end

  def take_turn
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

    board[pos].send(action)
    board.update_board(pos, action)
  end
end


game = Game.new.run
