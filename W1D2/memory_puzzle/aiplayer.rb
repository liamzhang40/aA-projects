class AiPlayer
attr_reader :guess_hash, :matched_guess, :previous_guess, :board_size, :name

  def initialize(board_size)
    @name = "Skynet"
    @guess_hash = {}
    @matched_guess = nil
    @previous_guess = nil
    @board_size = board_size
    p board_size
  end

  def remove_guess(card1, card2)
    guess_hash[card1.position] = false
    guess_hash[card2.position] = false
  end

  def add_seen_card(card1)
    @guess_hash[card1.position] = card1.value
  end

  # def get_guess(value)
  #   if matched_guess
  #     return second_matched_guess
  #   else
  #     seen_matches = get_seen_matches
  #     unless seen_matches.empty?
  #       has_a_match(seen_matches)
  #     else
  #       pos = random_guess
  #       previous_guess = pos
  #       return pos
  #     end
  #   end
  # end

  def has_a_match(seen_matches, card)
    unless card
      seen_matches[0].first
    else
      if card.position == seen_matches[0].first
        seen_matches[1].first
      else
        seen_matches[0].first
      end
    end
  end

  def random_guess
    p get_possible_guesses.sample

    # pos = [rand(board_size), rand(board_size)]
    # until check_valid_guess?(pos)
    #   pos = [rand(board_size), rand(board_size)]
    # end
    # pos
  end

  def get_possible_guesses
    res = []
    (board_size - 1).times do |row|
      (board_size - 1).times do |col|
        res << [row, col] unless guess_hash.has_key?([row, col])
      end
    end
    res
  end


  def get_seen_matches
    seen_matches = guess_hash.select { |k, v| guess_hash.values.count(v) > 1 && v }
    seen_matches
    seen_matches.sort_by { |k, v| v }
  end

  def check_valid_guess?(pos)
    !guess_hash.has_key?(pos)
  end

  def get_guess(card)
    print "Sentient Machine is thinking."
    sleep(1)
    print "."
    sleep(1)
    puts "."
    seen_matches = get_seen_matches
    unless seen_matches.empty?
      has_a_match(seen_matches, card)
    else
      random_guess
    end
  end
end
