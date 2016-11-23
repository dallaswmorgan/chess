require_relative 'piece.rb'
require_relative 'slidingpiece.rb'

class Queen < Piece
  include SlidingPiece
  POTENTIAL_MOVES = DIR_MODIFIER[:diagonal] + DIR_MODIFIER[:nondiagonal]

  def to_s
    @name = @color == 'white' ? " ♕ " : " ♛ "
  end
end
