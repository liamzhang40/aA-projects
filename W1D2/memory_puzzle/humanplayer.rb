class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def remove_guess(card1, card2)
    #does nothing DUMMY METHOD
  end

  def add_seen_card(card1)
    #does nothing DUMMY METHOD
  end

  def get_guess(card)
    pos = nil
    until check_valid_guess?(pos)
      puts "#{name} enter a position (ex. 2,3): "
      pos = gets.chomp.split(',').map(&:to_i)
    end
    pos
  end

  def check_valid_guess?(pos)
    pos.class == Array && pos.length == 2
  end
end
