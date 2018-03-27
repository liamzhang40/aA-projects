require_relative 'player'
require_relative 'board'
require_relative 'tile'

class Game
  attr_reader :board, :player

  def initialize(player)
    @board = Board.from_file
    @player = player
  end

  def play
    until over?
      pos, num = finalize_move
      board.
  end

  def finalize_move
    pos, num = [nil, nil]
    until board.valid_move(pos, num)
      pos, num = prompt
    end
    [pos, num]
  end

  def prompt
    player.get_move
  end

  def over?
    board.solved?
  end


end
