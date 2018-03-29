class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def rank
    if cards.all? {|card| card.suit == :diamond}
  end

  def compare(hand)
  end

  def is_flush
    get_length = cards.length
    (0...get.length - 1).each do |i|
      return false unless cards[i].suit == cards[i + 1].suit
    end
    true
  end

  def is_straight
    card_value = cards.map {|card| card.value}.sort
    (0...card_value.length - 1).each do |i|
      return false unless card_value[i] + 1 == card_value[i + 1]
    end
    true
    # card_value_to_compare = (card_value.min..card_value.max).to_a
    # card_value == card_value_to_compare
  end

  def is_fullhouse
    card_value = cards.map {|card| card.value}.sort
    if card_value[0]==card_value[1] && card_value[2]==card_value[4]
      return true
    elsif card_value[0]==card_value[2] && card_value[3]==card_value[4]
      return true
    end
    return false
  end

  def is_four
    card_value = cards.map {|card| card.value}.sort
    return card_value[0]==card_value[3] || card_value[1]==card_value[4]
  end

  def is_straight_flush
    return is_flush && is_straight
  end

  def is_three
    card_value = cards.map {|card| card.value}.sort
    (0..2).each do |i|
      if card_value[i]==card_value[i+2] && !is_fullhouse
        return true
      end
    end
    return false
  end




end
