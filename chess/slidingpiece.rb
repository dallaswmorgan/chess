module SlidingPiece
  def moves
    potential_moves = []

    MOVES.each do |move|
      potential_move = [pos[0] + move[0], pos[1] + move[1]]
      while board.in_bound?(potential_move)

        if board[potential_move].color == self.opposite_color
          potential_moves << potential_move
          break
        elsif board[potential_move].color == self.color
          break
        else
          potential_moves << potential_move
          potential_move =
            [potential_move[0] + move[0], potential_move[1] + move[1]]
        end
      end
    end

    potential_moves
  end
end
