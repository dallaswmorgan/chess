require 'piece.rb'
require 'SlidingPiece.rb'

class Rook < Piece
  MOVES = DIR_MODIFIER[:nondiagonal]
end
