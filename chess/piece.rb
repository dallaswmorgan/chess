class Piece
  attr_accessor :color, :pos
  attr_reader :name, :board

  DIR_MODIFIER = {
    diagonal: [[-1, -1], [-1, 1], [1, -1], [1, 1]],
    nondiagonal: [[-1, 0], [0, -1], [0, 1], [1, 0]]
  }

  def self.dup_piece(new_board, orig_piece)
    if orig_piece.is_a?(NullPiece)
      orig_piece
    else
      dup_piece = orig_piece.class.new(new_board, orig_piece.pos)
      if orig_piece.color == 'black'
        dup_piece.color == 'black'
      end
      dup_piece
    end
  end


  def initialize(board, pos)
    @name = 'piece'
    @color = 'white'
    @pos = pos
    @board = board
  end

  def to_s
    @name
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
