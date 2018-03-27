module Slideable

  def horizontal_dirs
    HORRZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    all_possible_moves = []
    test_pos = @pos.dup # set original posistion
    move_dirs.each do |dir| # loop through HORRZONTAL_DIRS
      test_pos = [test_pos[0] + dir[0], test_pos[1] + dir[1]]
      # debugger
      while test_pos.all? {|el| el.between?(0, 7)} # will stop when test position is outside of board
        # if position is inside the board and is a NullPiece, it will be shoveled
        # if position has a piece with different, it will also be shoveled
        if @board[test_pos].is_a?(NullPiece)
          all_possible_moves << test_pos
        else
          all_possible_moves << test_pos if @board[@pos].color != @board[test_pos].color
          break
        end

        test_pos = [test_pos[0] + dir[0], test_pos[1] + dir[1]] # increment test position
      end

      test_pos = @pos.dup # after one direction, test postion will be reset to original position
    end
    all_possible_moves
  end

  private

  HORRZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[-1, 1], [1, -1], [1, 1], [-1, -1]]

  def move_dirs
    raise "you should not be here, you should go look for move_dirs in the actual pieces"
  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end

end
