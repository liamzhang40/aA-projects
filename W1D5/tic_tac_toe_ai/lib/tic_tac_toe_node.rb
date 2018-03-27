require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    # return true if board.winner == evaluator
    # return false if board.over? && board.winner != evaluator
    return board.won? && board.winner != evaluator if board.over?

    if next_mover_mark == evaluator
      children.all? {|child| child.losing_node?(evaluator)}
    else
      children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    return board.winner == evaluator if board.over?

    if next_mover_mark == evaluator
      children.any? {|child| child.winning_node?(evaluator)}
    else
      children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_pos = board.rows.select {|pos| board[pos].empty?}
    empty_pos.map do |pos|
      new_board = (board.dup[pos] = next_mover_mark)
      next_mover_mark = next_mover_mark == :o ? :x : :o
      prev_move_pos = pos
      TicTacToe.new(new_board, next_mover_mark, prev_move_pos)
    end

  end
end
