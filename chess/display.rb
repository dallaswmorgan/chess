require "colorize"
require_relative "cursor.rb"
 require_relative "board.rb"

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    puts @board.grid.map.with_index { |row, i| display_row(row, i) }.join("\n#{border}\n")
  end

  def display_row(row, i)
    row.map.with_index do |space, j|
      if [i, j] == @cursor.cursor_pos
        space.to_s.colorize(:red)
      else
        space.to_s
      end
    end.join("|")
  end

  def border
    "_" * 31
  end

  def move_cursor
    loop do
      system("clear")
      self.render
      @cursor.get_input
    end
  end
end
