# frozen_string_literal: true

# Dummy class for showing the board
class Board
  attr_reader :board

  def initialize
    @board = []
    create_board
  end
 
  public 
  
  def create_board
    j = 0
    0.upto(7) do
      row = []
      i = 0
      0.upto(7) do
        coords = [j, i]
        row << coords
        i += 1
      end
      j += 1
      i = 0
      board << row
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
