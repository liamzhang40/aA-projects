require_relative 'piece'
require 'Singleton'

class NullPiece < Piece
  attr_reader :symbol, :color

  include Singleton

  def initialize
    @symbol = nil
    @color = nil
  end

  def to_s
    " "
  end


end
