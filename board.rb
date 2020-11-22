# frozen_string_literal: true

# Dummy class for showing the board
class Board
  attr_reader :board

  def initialize
    @board = []
    create_board
  end

  def create_board
    @j = 0
    while @j < 8
      @row = []
      @i = 0
      push_row while @i < 8
      @j += 1
      @i = 0
      board << @row
    end
    show_board(board)
  end

  private

  def push_row
    coords = [@j, @i]
    @row << coords
    @i += 1
  end

  def show_board(board)
    print "Here's your board : \n "
    print "\n"
    board.each { |row| p row }
  end
end
