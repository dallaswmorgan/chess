module SteppingPiece
  def moves
    MOVES.map { |move| [move[0] + pos[0], move[1] + pos[1]] }
  end
end
