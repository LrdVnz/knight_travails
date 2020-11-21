# frozen_string_literal: true

# class for the possible moves
class Moves
  attr_reader :list

  def initialize
    @list = [
      [-2, -1],
      [-2, +1],
      [+2, +1],
      [+2, -1],
      [-1, +2],
      [-1, -2],
      [+1, +2],
      [+1, -2]
    ]
  end
 
  public 
  
  def getMove(moveNumber)
    @list[moveNumber]
  end
end
