class Piece
  attr_accessor :color

  def initialize
    @name = 'piece'
    @color = 'white'
  end
end

class Knight < Piece
end

class Pawn < Piece
end

class Bishop < Piece
end

class Rook < Piece
end

class Queen < Piece
end

class King < Piece
end

class NullPiece < Piece
  def initialize
    @color = nil
  end
end
