require 'card'

class Deck
  attr_reader :cards, :discarded_cards

  def initialize
    @cards = []
    populate
    @discarded_cards = []
  end

  def populate
    Card::SUITS.each do |suit|
      Card::NUMBERS.each do |num|
        @cards << Card.new(suit, num)
      end
    end
  end

  def draw(num)
    if num > cards.length
      raise ArgumentError.new "There is not enough cards in the deck!!"
    else
      cards.pop(num)
    end
  end

  def receive_trash(arr)
    discarded_cards.push(*arr)
  end


end
