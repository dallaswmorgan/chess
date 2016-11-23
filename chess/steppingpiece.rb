module SteppingPiece
  def moves
    potential_moves = self.class::POTENTIAL_MOVES.map { |move| [move[0] + pos[0],
                                          move[1] + pos[1]] }
    legal_moves = potential_moves.select do |move|
      board.in_bounds?(move) && board[move].color != color
    end
  end
end
