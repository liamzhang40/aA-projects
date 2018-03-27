class Pawn < Piece

  def initialize(pos, color, board)
    super
  end

  def symbol
    "P"
  end

  def move_dirs

  end

  private

  def at_start_row?
    return true if @color == "white" && @pos[0] == 6
    return true if @color == "black" && @pos[0] == 1
  end

  def forward_dir
    return 1 if @color == "white"
    return -1 if @color == "black"
  end

  def forward_steps
    at_start_row? ? forward_dir * 2 : forward_dir
  end

  def side_attacks

  end
end
