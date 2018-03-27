require 'set'
require_relative 'player'

ALPHABET = ("a".."z").to_a
class Ghost
  attr_reader :dictionary
  attr_accessor :players, :current_player, :fragment

  def initialize(*players)
    @players = players
    word_arr = File.readlines("dictionary.txt").map(&:chomp)
    @dictionary = Set.new(word_arr)
    @current_player = players.sample
    @fragment = ""
  end

  def play
    until game_over?
      take_turn(current_player)
      strike_and_reset if dictionary.include?(fragment)
      eliminate! if current_player.strikes == 5
      next_player!
    end
    puts "Game over!! #{players[0].name} won!"
  end

  private

  def game_over?
    players.length == 1
  end

  def strike_and_reset
    current_player.strikes += 1
    display_standings
    @fragment = ""
  end

  def eliminate!
    puts "#{current_player.name} has been eliminated"
    players.delete(current_player)
  end

  def previous_player
    pre_idx = (players.index(current_player) - 1) % players.length
    players[pre_idx]
  end

  def next_player!
    if players.include?(current_player)
      next_idx = (players.index(current_player) + 1) % players.length
      @current_player = players[next_idx]
    else
      @current_player = players.sample
    end
  end

  def take_turn(player)
    letter = player.guess
    until valid_play?(letter)
      player.alert_invalid_guess
      letter = player.guess
    end
    fragment << letter
    puts "The new fragment is #{fragment}."
  end

  def valid_play?(letter)
    return false unless ALPHABET.include?(letter.downcase)
    test_fragment = fragment + letter
    dictionary.any? {|word| word.start_with?(test_fragment)}
  end

  def display_standings
    players.each do |player|
      puts "#{player.name} has #{"GHOST".slice(0..player.strikes)}."
      puts "-------------------"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Ghost.new(Player.new("Liam"), Player.new("David"), Player.new("Thomas")).play
end
