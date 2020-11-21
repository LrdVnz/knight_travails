# frozen_string_literal: true

load 'position.rb'
load 'moves.rb'
load 'board.rb'
load 'helpers.rb'

# Knight class. Holds main function
class Knight
  include Helpers
  attr_reader :moves
  
  def initialize
    @moves = Moves.new
  end

  public 
  
  def moveto(start, goal)
    print "\n Calculating shortest path from #{start} to #{goal} .... \n"
    queue = []
    visited = []
    previous_nodes = []
    current = Position.new(start)
    queue << current
    loop do
      current = queue.shift
      coords = current.coords
      visited << current
      if coords == goal
        print 'goal reached !!'
        print_path
        return
      else
        i = 0
        while i < 8
          move_result = makeMove(moves.list[i], coords)
          unless move_result.nil?
            move_result = Position.new(move_result)
            previous_nodes << move_result.previous(current)
            push_result(queue, visited, current, move_result) unless visited.include?(move_result)
            if move_result.coords == goal
              calculate_path(previous_nodes, start, goal)
              return
            end
          end
          i += 1
        end
      end
    end
  end
end

k = Knight.new
Board.new
k.moveto([3, 3], [3, 4])
