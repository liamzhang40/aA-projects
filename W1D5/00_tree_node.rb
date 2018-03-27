class PolyTreeNode
  # attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def add_child(node)
    children << node
    node.parent = self
  end

  def remove_child(node)
    if children.include?(node)
      children.delete(node)
      node.parent = nil
    else raise "No such children found!"
    end
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    parent.children.delete(self) if parent
    @parent = node
    node.children << self unless (node.nil? || node.children.include?(self))
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
      previous_res = child.dfs(target_value)
      return previous_res if previous_res
    end
    nil
    # Very wrong method
    # nil(returned from d) is returned prematurely from b skipping e
    # return self if self.value == target_value
    # children.each do |child|
    #   previous_res = child.dfs(target_value)
    #   return previous_res unless previous_res.is_a? Array
    # end
    # nil
  end
  # not a recursive method

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      queue_first = queue.shift
      return queue_first if queue_first.value == target_value
      queue.concat(queue_first.children)
    end
  end
end
