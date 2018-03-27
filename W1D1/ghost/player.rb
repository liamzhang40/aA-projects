class Player
  attr_reader :name
  attr_accessor :strikes

  def initialize(name)
    @name = name
    @strikes = 0
  end

  def guess
    puts "#{name} please enter a letter: "
    letter = gets.chomp
  end

  def alert_invalid_guess
    puts "Input is either not an alphabet or not the beginning of a word."
  end

end
