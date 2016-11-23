require_relative 'piece.rb'
require_relative 'steppingpiece.rb'


class King < Piece
  include SteppingPiece
  POTENTIAL_MOVES = DIR_MODIFIER[:diagonal] + DIR_MODIFIER[:nondiagonal]

  def to_s
    @name = @color == 'white' ? " ♔ " : " ♚ "
  end
end
