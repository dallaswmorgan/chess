require 'piece.rb'

class Pawn < Piece

  WHITEMOVES = [[1, -1], [1, 1], [1, 0], [2, 0]]
  BLACKMOVES = [[-1, -1], [-1, 1], [-1, 0], [-2, 0]]
  def moves
    potential_moves = []
    if self.color == 'white'
      #can only move down or downleft/right
      WHITEMOVES.each do |move|
        potential_move = [pos[0] + move[0], pos[1] + move[1]]
        if (move == [1, -1] || move == [1,1]) &&
          board[potential_move].color == 'black'
          potential_moves << potential_move
        elsif move == [2, 0]
          if self.pos[0] == 1 && board[potential_move].is_a?(NullPiece) &&
            board[pos[0] + 1, pos[1]].is_a?(NullPiece)
            potential_moves << potential_move
          end
        elsif board[potential_move].is_a?(NullPiece)
          potential_moves << potential_move
        end
      end
    else
      BLACKMOVES.each do |move|
        potential_move = [pos[0] + move[0], pos[1] + move[1]]
        if (move == [-1, -1] || move == [-1,1]) &&
          board[potential_move].color == 'white'
          potential_moves << potential_move
        elsif move == [-2, 0]
          if self.pos[0] == 6 && board[potential_move].is_a?(NullPiece) &&
            board[pos[0] - 1, pos[1]].is_a?(NullPiece)
            potential_moves << potential_move
          end
        elsif board[potential_move].is_a?(NullPiece)
          potential_moves << potential_move
        end
      end
    end
  end
end
