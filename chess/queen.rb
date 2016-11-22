require 'piece.rb'
require 'SlidingPiece.rb'

class Queen < Piece
  MOVES = DIR_MODIFIER[:diagonal] + DIR_MODIFIER[:nondiagonal]
end
