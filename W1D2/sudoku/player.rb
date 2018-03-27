class Player

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Pick a position (ex. 2,3)"
    pos = gets.chomp.split(",").map(&:to_i)
    puts "Place a number"
    num = gets.chomp.to_i
    [pos, num]
  end


end
