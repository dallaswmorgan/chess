require 'piece.rb'
require 'SteppingPiece.rb'


class King < Piece
  MOVES = DIR_MODIFIER[:diagonal] + DIR_MODIFIER[:nondiagonal]
  # [[-1,-1], [-1, 0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]

end
