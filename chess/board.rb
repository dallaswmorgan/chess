require 'byebug'
require_relative 'piece.rb'
require_relative 'nullpiece.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'pawn.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'slidingpiece.rb'
require_relative 'steppingpiece.rb'

class Board
  attr_accessor :grid
  attr_reader :white_king, :black_king

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @blank = NullPiece.instance
    populate_grid
    assign_teams
  end


  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate_grid
    rook_positions = [[0, 0], [0, 7], [7, 0], [7, 7]]
    rook_positions.each { |pos| self[pos] = Rook.new(self, pos) }

    knight_positions = [[0, 1], [0, 6], [7, 1], [7, 6]]
    knight_positions.each { |pos| self[pos] = Knight.new(self, pos) }

    bishop_positions = [[0, 2], [0, 5], [7, 2], [7, 5]]
    bishop_positions.each { |pos| self[pos] = Bishop.new(self, pos) }
    #
    pawn_positions = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5],
                      [1, 6], [1, 7], [6, 0], [6, 1], [6, 2], [6, 3],
                      [6, 4], [6, 5], [6, 6], [6, 7]]

    pawn_positions.each { |pos| self[pos] = Pawn.new(self, pos) }

    queen_positions = [[0, 4], [7, 3]]
    queen_positions.each { |pos| self[pos] = Queen.new(self, pos) }

    # king_positions = [[0, 3], [7, 4]]
    # king_positions.each { |pos| self[pos] = King.new(self, pos) }

    white_king_position = [0,3]
    @white_king = King.new(self, white_king_position)
    self[white_king_position] = @white_king

    black_king_position = [7,4]
    @black_king = King.new(self, black_king_position)
    self[black_king_position] = @black_king


    2.upto(5).each do |row|
      0.upto(7).each do |col|
        self[[row, col]] = @blank
      end
    end
  end

  def assign_teams
    @grid[6..7].each do |row|
      row.each { |piece| piece.color = "black" }
    end
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    end_piece = self[end_pos]

    raise "No piece at starting position" if piece == @blank
    if end_piece == @blank
      self[start_pos].pos = end_pos
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    elsif end_piece.color != piece.color
      self[start_pos].pos = end_pos
      self[end_pos] = piece
      self[start_pos] = @blank
    # elsif end_piece.color == piece.color
    #   raise "Cannot Capture Your own Piece"
    end
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end


  def in_check?(color)
    king_pos = color == 'white' ? white_king.pos : black_king.pos
    grid.each do |row|
      row.each do |piece|
        next unless piece.color == self[king_pos].opposite_color
        return true if piece.moves.include?(king_pos)
      end
    end
    false
  end

  def checkmate?(color)
    king_pos = color == 'white' ? white_king.pos : black_king.pos

    grid.each do |row|
      row.each do |piece|
        if piece.color == color
          piece.moves.each do |move|
            new_board = self.dup_board
            new_board.move_piece(piece.pos, move)
            unless new_board.in_check?(color)
              return false
            end
          end
        end
      end
    end
    true
  end

  def dup_board
    new_board = Board.new

    8.times do |i|
      8.times do |j|
        new_board[[i,j]] = Piece.dup_piece(new_board, self[[i,j]])
      end
    end
    #
    # new_board.grid.map do |row|
    #   # byebug
    #   row.map do |piece|
    #     debugger
    #     Piece.dup_piece(new_board, self[piece.pos])

    new_board
  end
end
