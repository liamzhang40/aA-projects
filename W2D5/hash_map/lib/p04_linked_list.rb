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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  attr_reader :head, :tail

  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true unless first
    false
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
    if empty?
      head.next = new_node
      new_node.next = tail
      tail.prev = new_node
      new_node.prev = head
    else
      last.next = new_node
      new_node.prev = last
      new_node.next = tail
      tail.prev = new_node
    end
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key
    end

  end

  def remove(key)
    each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each(&prc)
    unless empty?
      node = head.next
      until node == tail
        # debugger
        prc.call(node)
        node = node.next
      end
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
