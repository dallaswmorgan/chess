require_relative 'piece.rb'
require_relative 'slidingpiece.rb'

class Bishop < Piece
  include SlidingPiece
  POTENTIAL_MOVES = DIR_MODIFIER[:diagonal]

  def to_s
    @name = @color == 'white' ? " ♗ " : " ♝ "
  end
end
