require_relative '00_tree_node'

class KnightPathFinder
  attr_reader :visited_positions, :start_pos, :move_tree

  def self.valid_moves(pos)
    pos_diffs = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    possible_pos = []
    pos_diffs.each do |sub_diff|
      end_pos = [pos[0] + sub_diff[0], pos[1] + sub_diff[1]]
      possible_pos << end_pos if end_pos.all? {|num| (0..8).include?(num)}
    end
    possible_pos
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    output_positions = []
    self.class.valid_moves(pos).each do |sub_pos|
      unless visited_positions.include?(sub_pos)
        visited_positions << sub_pos
        output_positions << sub_pos
      end
    end
    output_positions
  end

  def build_move_tree
    @move_tree = PolyTreeNode.new(start_pos)
    positions = [@move_tree]
    until positions.empty?
      current_postion = positions.shift
      next_moves = new_move_positions(current_postion.value)
      next_moves.each do |move|
        new_move_node = PolyTreeNode.new(move)
        current_postion.add_child(new_move_node)
        positions << new_move_node
      end
    end

  end

  def find_path(end_pos)
    end_node = @move_tree.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    return [end_node.value] if end_node.parent.nil?
    trace_path_back(end_node.parent) + [end_node.value]
  end
end

if __FILE__ == $PROGRAM_NAME
  path = KnightPathFinder.new([0, 0])
  path.build_move_tree
  p path.find_path([1, 0])
end
