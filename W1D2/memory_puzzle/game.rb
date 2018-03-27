require_relative 'card'
require_relative 'humanplayer'
require_relative 'board'
require_relative 'aiplayer'

class Game

attr_reader :board, :current_guess, :previous_guess, :players, :current_player, :score
  def initialize
    @current_guess = nil
    @previous_guess = nil
    @board = Board.new(4)
    @players = [HumanPlayer.new("Liamzack"), HumanPlayer.new("Zackliam"), AiPlayer.new(board.grid.length)].shuffle
    @current_player = players[0]
    @score = Hash.new(0)
  end

  def play
    board.populate
    until over?
      take_turn
    end
    winner = get_winner
    puts "#{winner.name} you won!"
  end

  def take_turn
    system('clear')
    get_guesses
    if previous_guess == current_guess
      puts "It's a match!"
      score_point
      sleep(2)
      update_players_remove(previous_guess, current_guess)
    else
      puts "NICE TRY LOSER"
      sleep(2)
      hide_cards
      switch_player!
      update_players_seen(current_guess)
    end
    announce_score
    sleep(2)
  end

  def update_players_remove(card1, card2)
    players.each do |player|
      player.remove_guess(card1, card2)
    end
  end

  def update_players_seen(card)
    players.each do |player|
      player.add_seen_card(card)
    end
  end

  def switch_player!
    players.rotate!
    @current_player = players[0]
  end

  def get_guesses
    display_board
    guess1 = prompt(nil)
    @previous_guess = board.reveal(guess1)
    update_players_seen(previous_guess)
    display_board
    guess2 = prompt(previous_guess)
    @current_guess = board.reveal(guess2)
    display_board
  end

  def hide_cards
    previous_guess.hide
    current_guess.hide
  end

  def display_board
    board.render
  end

  def over?
    board.won?
  end

  def prompt(card)
    current_player.get_guess(card)
  end

  def score_point
    @score[current_player] += 1
  end

  def announce_score
    players.each do |player|
      puts "#{player.name} has #{score[player]} points"
    end
  end

  def get_winner
    winner = score.sort_by { |k, v| v }
    winner.last.first
  end

end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play
end
