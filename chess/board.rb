require_relative "piece.rb"
require 'byebug'

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @blank = NullPiece.new
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
    rook_positions.each { |pos| self[pos] = Rook.new }

    knight_positions = [[0, 1], [0, 6], [7, 1], [7, 6]]
    knight_positions.each { |pos| self[pos] = Knight.new }

    bishop_positions = [[0, 2], [0, 5], [7, 2], [7, 5]]
    bishop_positions.each { |pos| self[pos] = Bishop.new }
    #
    pawn_positions = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5],
                      [1, 6], [1, 7], [6, 0], [6, 1], [6, 2], [6, 3],
                      [6, 4], [6, 5], [6, 6], [6, 7]]

    pawn_positions.each { |pos| self[pos] = Pawn.new }

    queen_positions = [[0, 4], [7, 3]]
    queen_positions.each { |pos| self[pos] = Queen.new }

    king_positions = [[0, 3], [7, 4]]
    king_positions.each { |pos| self[pos] = King.new }


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
    raise "No piece at starting position" if self[start_pos] == @blank
    if self[end_pos] == @blank
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    elsif self[end_pos].color != self[start_pos].color
      self[end_pos] = self[start_pos]
      self[start_pos] = @blank
    elsif self[end_pos].color == self[start_pos].color
      raise "Cannot Capture Your own Piece"
    end
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end
end
