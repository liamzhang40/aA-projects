require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require "byebug"

# Overall constant operation assuming each linkedlist bucket
# only contains one node
class HashMap
  attr_reader :store
  attr_accessor :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    linkedlist_bucket(key).include?(key)
  end

  def set(key, val)
    resize! if count == num_buckets
    if include?(key)
      linkedlist_bucket(key).update(key, val)
    else
      linkedlist_bucket(key).append(key, val)
      @count += 1
    end
  end

  def get(key)
    linkedlist_bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      linkedlist_bucket(key).remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  def linkedlist_bucket(key)
    store[key.hash % num_buckets]
  end
  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(count * 2) {LinkedList.new}

    @count = 0

    each do |key, val|
      list = new_store[key.hash % new_store.length]
      list.append(key, val)
    end

    @store = new_store
  end

end
