require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList

  attr_reader :head, :tail

  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = tail
    @tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end # for passing the spec only ?

  def first
    head.next
  end

  def last
    tail.prev
  end

  def empty?
    first == tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = tail
    new_node.prev = last
    last.next = new_node
    tail.prev = new_node
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    each do |node|
      node.remove if node.key == key
    end
  end

  def each(&prc)
    each_node = first
    until each_node == tail
      prc.call(each_node)
      each_node = each_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
