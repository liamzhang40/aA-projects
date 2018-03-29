class TowersOfHanoi

  attr_accessor :sticks, :game_over

  def initialize
    @sticks=[[3,2,1], [], []]
    @game_over = false
  end

  def get_input
    begin
      puts "Enter starting stick, end stick"
      input = gets.chomp.split(',').map(&:to_i)
      valid_input?(input)
    rescue ArgumentError => e
      puts e.message
      retry
    end
    return input
  end

  def valid_input?(arr)
    start,fin = arr
    if arr.length != 2 || arr.any? {|el| !el.between?(0, 2)}
      raise ArgumentError.new "Enter two numbers between 0 to 2 and separated by comma!"
    elsif sticks[start].empty?
      raise ArgumentError.new "Can't move from an empty stick."
    elsif !sticks[fin].empty? && sticks[start][-1] > sticks[fin][-1]
      raise ArgumentError.new "Can't move bigger disc onto smaller disc."
    end
  end

  def move(input)
    start,fin = input
    sticks[fin].push(sticks[start].pop)
  end

  def check_won?
    if sticks.last(2).any? {|stick| stick.length == 3}
      self.game_over = true
    end
  end

  def render
    (0..2).each do |row|
      sticks.each do |stick|
        if stick[2-row] == nil
          print "   "
        else
          print "#{stick[2-row]}  "
        end
      end
      print "\n"
    end
    puts "0  1  2"
  end

  def play
    until game_over
      self.render
      input = get_input
      move(input)
      check_won?
    end
    self.render
    puts "YOU WIN!!!!"
  end




end
