# frozen_string_literal: true

# Dummy class for showing the board
class Board
  attr_reader :board

  def initialize
    @board = []
    create_board
  end

  def create_board
    8.times do |col_num|
      @row = []
      8.times do |row_num|
        coords = [col_num, row_num]
        @row << coords
      end
      board << @row
    end
    show_board(board)
  end

  private

  def show_board(board)
    print "Here's your board : \n "
    print "\n"
    board.each { |row| p row }
  end
end
