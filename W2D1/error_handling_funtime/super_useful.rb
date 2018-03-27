# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise ArgumentError.new("I like coffee, but give me another fruit")
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue ArgumentError => e
    puts e.message
    retry
  rescue StandardError
    puts "I don't like that!"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise "You forgot your friend's name!!" if name.length <= 0
    rescue StandardError => e
      puts "#{e.message}"
    end
    @name = name

    begin
      raise "You know this person for less than 5 years" if yrs_known < 5
    rescue StandardError => e
      puts "#{e.message}"
      puts "I will just set the years known to 5"
    ensure
      yrs_known < 5 ? @yrs_known = 5 : @yrs_known = yrs_known
    end

    begin
      raise "You forgot your favorite past time!!" if fav_pastime.length <= 0
    rescue StandardError => e
      puts "#{e.message}"
    end
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
