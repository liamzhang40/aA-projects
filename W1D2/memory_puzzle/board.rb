require_relative 'card'
require_relative 'humanplayer'

 class Board
  attr_reader :grid

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
  end

  def populate
    shuffled_pairs = get_pairs.shuffle
    grid.length.times do |row|
      grid.length.times do |col|
        self[[row, col]] = Card.new(shuffled_pairs.pop, [row, col])
      end
    end
  end

  def render
    grid.reverse.each do |row|
      puts "#{display_row(row)}\n"
    end
  end

  def display_row(row_array)
    row_array.inject('') do |acc, card|
      if card.status
        acc + ' ' + card.to_s
      else
        acc + ' X'
      end
    end
  end

  def won?
    grid.each do |row|
      return false if row.any? {|card| card.status == false}
    end
    true
  end

  def reveal(guessed_pos)
    guessed_card = self[guessed_pos]
    guessed_card.reveal
    guessed_card
  end


  private

  def get_pairs
    pairs = []
    2.times do
      pairs += (1..(grid.length**2) / 2).to_a
    end
    pairs
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, card)
    row, col = pos
    @grid[row][col] = card
  end
end
