require 'singleton'
require_relative 'piece.rb'

class NullPiece < Piece
  include Singleton


  def initialize
    @color = nil
    @name = " ⧠ "
  end

end
