class Card
  attr_reader :status, :value, :position

  def initialize(value, pos)
    @value = value
    @status = false
    @position = pos
  end

  def display
    value if status
  end

  def hide
    @status = false
  end

  def reveal
    @status = true
  end

  def to_s
    value.to_s
  end

  def ==(card)
    value == card.value
  end

end
