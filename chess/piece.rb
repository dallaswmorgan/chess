class Piece

  attr_accessor :color
  attr_reader :name

  def initialize
    @name = 'piece'
    @color = 'white'
  end

  def to_s
    name
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
    super
    @color = nil
  end
end
