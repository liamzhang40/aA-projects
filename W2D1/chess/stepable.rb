module Stepable

  def king_diffs
    KING_DIFFS
  end

  def knight_diffs
    KNIGHT_DIFFS
  end

  def moves
    center_pos = @pos.dup # set original posistion

    move_diffs.map do |diff|
      test_pos = [center_pos[0] + diff[0], center_pos[1] + diff[1]]
      if test_pos.all? {|el| el.between?(0, 7)} && @board[@pos].color != @board[test_pos].color
        test_pos
      end
    end.compact
  end

  private

  KING_DIFFS = [[0, 1], [0, -1], [1, 0], [-1, 0], [-1, 1], [1, -1], [1, 1], [-1, -1]]
  KNIGHT_DIFFS = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]

  def move_diffs
    raise "you should not be here, you should go look for move_diffs in the actual pieces"
  end

end
