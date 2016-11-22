require 'piece.rb'
require 'SlidingPiece.rb'

class Bishop < Piece
  MOVES = DIR_MODIFIER[:diagonal]
end
