require_relative 'piece.rb'
require_relative 'steppingpiece.rb'

class Knight < Piece
  include SteppingPiece
  POTENTIAL_MOVES = [[-2,-1], [-2,1], [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1]]

  def to_s
    @name = @color == 'white' ? " ♘ " : " ♞ "
  end
end
