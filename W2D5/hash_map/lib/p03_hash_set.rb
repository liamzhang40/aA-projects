require_relative 'p02_hashing'

class HashSet

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
    store[num.hash % num_buckets]
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
