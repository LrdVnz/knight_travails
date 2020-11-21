# frozen_string_literal: true

load 'position.rb'
load 'moves.rb'
load 'board.rb'
load 'calculate_path.rb'

# Knight class. Holds main function
class Knight < Moves
  include CalculatePath
  attr_reader :moves, :arrays

  def initialize
    @moves = Moves.new
    @arrays =
      {
        'queue' => [],
        'visited' => [],
        'previous_nodes' => []
      }
  end

  def moveto(start, goal)
    print "\n Calculating shortest path from #{start} to #{goal} .... \n"
    current = Position.new(start)
    arrays['queue'] << current
    loop do
      current = arrays['queue'].shift
      arrays['visited'] << current
      if start == goal
        print 'start goal same'
        return
      end
      i = 0
      while i < 8
        move_result = make_move(moves.list[i], current.coords)
        unless move_result.nil?
          move_result = Position.new(move_result)
          push_result(arrays, current, move_result) unless arrays['visited'].include?(move_result)
          if move_result.coords == goal
            calculate_path(arrays['previous_nodes'], start, goal)
            return
          end
        end
        i += 1
      end
    end
  end

  def push_result(arrays, current, move_result)
    arrays['previous_nodes'] << move_result.previous(current)
    arrays['queue'].push(move_result)
    arrays['visited'].push(move_result)
    current.add_adjacent(move_result)
  end
end

k = Knight.new
Board.new
k.moveto([3, 3], [3, 4])
