module SlidingPiece
  def moves
    potential_moves = []

    self.class::POTENTIAL_MOVES.each do |move|
      potential_move = [pos[0] + move[0], pos[1] + move[1]]
      while board.in_bounds?(potential_move)

        case board[potential_move].color
        when opposite_color
          potential_moves << potential_move
          break
        when color
          break
        end

        potential_moves << potential_move
        potential_move =
          [potential_move[0] + move[0], potential_move[1] + move[1]]
      end
    end

    potential_moves
  end
end
