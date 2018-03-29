def naive_mwr(arr, w)
  current_max_range = nil
  (0..arr.length - w).each do |idx|
    mm_diff = arr[idx..idx + w - 1].max - arr[idx..idx + w -1].min
    current_max_range = mm_diff if current_max_range.nil? || (current_max_range < mm_diff)
  end
  current_max_range
end

p naive_mwr([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_mwr([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_mwr([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_mwr([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def expert_mwr(arr, w)
  current_max_range = nil
  (0..arr.length - w).each do |idx|
    

    mm_diff =
    current_max_range = mm_diff if current_max_range.nil? || (current_max_range < mm_diff)
  end
  current_max_range
end






class MyQueue
  def initialize
    @store = []
  end

  def enqueue(n)
    store.push(n)

    store.dup
  end

  def dequeue
    store.shift
  end

  def peek
    store.first
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  private
  attr_reader :store
end

class MyStack

  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    store.pop
  end

  def push(n)
    max_min_check(n)
    store.push(n)
    store.dup
  end

  def max_min_check(n)
    @max = n if !max || n > max
    @min = n if !min || n < min
  end

  def peek
    store.last
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  private
  attr_reader :store
end

class StackQueue
  def initialize
    @left_store = MyStack.new
    @right_store = MyStack.new
  end

  def enqueue(n)
    left_store.push(n)
  end

  def empty?
    left_store.empty?
  end

  def max
    left_store.max
  end

  def min
    left_store.min
  end

  def dequeue
    raise "nothing to dequeue" if empty?
    until empty?
      right_store.push(left_store.pop)
    end
    dq = right_store.pop
    until right_store.empty?
      left_store.push(right_store.pop)
    end
    dq
  end

  def size
    [left_store.size, right_store.size].max
  end

  private
  attr_reader :left_store, :right_store

end
