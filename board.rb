require 'pry'

# frozen_string_literal: true

class Board
  attr_reader :board
  def initialize
    @board = []
    create_board
  end

  def create_board
    coord = [0, 0]
    j = 0
    0.upto(7) do
      arr = []
      i = 0
      0.upto(7) do
        coord = [j, i]
        arr << coord
        i += 1
      end
      j += 1
      i = 0
      @board << arr
    end
    @board.each { |a| p a }
  end

end

class Knight
  attr_accessor :pos
  def initialize(a, b)
    @pos = [a , b]   
  end

  #all moves combination are binary tree. traverse the tree recursively and stop at the path that gives the solution.
  def moveto(goal, pos)

    if pos === goal
      return 
    elsif (pos[0] < 0 ||  pos[0] > 7) || ( pos[1] < 0 ||  pos[1] > 7) 
      pos = @pos 
      return 
    end 

     pos[0] -= 2
     pos[1] -= 1
    moveto(goal,  pos)
     
     pos[0] -= 1
     pos[1] -= 2
    moveto(goal,  pos)
    
     pos[0] -= 2
     pos[1] += 1
    moveto(goal,  pos)
      
     pos[0] += 2
     pos[1] -= 1
    moveto(goal,  pos)

     pos[0] += 1
     pos[1] -= 2
    moveto(goal,  pos)
    
     pos[0] -= 1
     pos[1] += 2
    moveto(goal,  pos)

     pos[0] += 2
     pos[1] += 1
    moveto(goal,  pos)

     pos[0] += 1
     pos[1] += 2
    moveto(goal,  pos)

    print " \n pos after : #{pos} \n"
  end
  
end

k = Knight.new(3,3)
Board.new

k.moveto([6,4], [3,3])
 
binding.pry




