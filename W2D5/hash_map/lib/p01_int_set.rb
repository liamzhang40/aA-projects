class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    if is_valid?(num)
      validate!(num)
    end
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless num <= max && num >= 0
    return true
  end

  def validate!(num)
    store[num] = true
  end
end




class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    raise "Number is already inserted" if include?(num)
    self[num] << num
  end

  def remove(num)
    raise "Number is not in the set" unless include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end



class ResizingIntSet
  attr_reader :count
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == store.length
    unless include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = store.dup
    @store = Array.new(count * 2) {Array.new}
    @count = 0
    old_store.each do |bucket|
      bucket.each {|num| insert(num)}
    end
  end
end
