class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count, :store

  include Enumerable

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @push_idx = 0
    @unshift_idx = capacity - 1
  end

  def [](i)
    if i > count
      return nil
    elsif i < 0
      return nil if -i < count
      store[count + i]
    else
      store[]
    end
  end

  def []=(i, val)
    store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    each do |el|
      return true if el == val
    end
  end

  def push(val)
    resize! if capacity = count

    @count += 1
  end

  def unshift(val)
  end

  def pop
  end

  def shift
  end

  def first
    store[0]
  end

  def last
    store[capacity - 1]
  end

  def each(&prc)
    i = 0
    while i < capacity - 1
      prc.call(self[i])
      i += 1
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!

  end
end
