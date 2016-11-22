class Piece

  attr_accessor :color, :pos
  attr_reader :name, :board

  DIR_MODIFIER = {
    diagonal: [[-1, -1], [-1, 1], [1, -1], [1, 1]],
    nondiagonal: [[-1, 0], [0, -1], [0, 1], [1, 0]]
  }

  def initialize(board, pos)
    @name = 'piece'
    @color = 'white'
    @pos = pos
    @board = board
  end

  def to_s
    name
  end

  def moves
    possible_moves = []
  end

  def opposite_color
    if color == 'white'
      'black'
    elsif color == 'black'
      'white'
    end
  end
end
