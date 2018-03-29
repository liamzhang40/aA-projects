class Card
  NUMBERS = (1..13).to_a
  SUITS = [:diamond, :spade, :club, :heart]

  attr_reader :suit, :number

  def initialize(suit,num)
    @suit=suit
    @number=num
  end

  def ==(card)
    self.suit == card.suit && self.number == card.number
  end


end
