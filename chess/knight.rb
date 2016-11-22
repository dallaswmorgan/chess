require 'piece.rb'
require 'SteppingPiece.rb'

class Knight < Piece
  MOVES = [[-2,-1], [-2,1] [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1]]
end
