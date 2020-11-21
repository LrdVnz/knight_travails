# frozen_string_literal: true

# helpers for the knight class
module Helpers

  def makeMove(move, pos)
    if (pos[0] + move[0]).negative? || (pos[0] + move[0]) > 7 || (pos[1] + move[1]).negative? || (pos[1] + move[1]) > 7
      nil
    else
      result = []
      result[0] = pos[0] + move[0]
      result[1] = pos[1] + move[1]
      result
    end
  end

  def push_result(queue, visited, current, move_result)
    queue.push(move_result)
    visited.push(move_result)
    current.add_adjacent(move_result)
  end

  def calculate_path(previous_nodes, start, goal)
    list = previous_nodes.uniq
    current = list.last
    path = []
    while current != list.first
      path << current
      current = current.previous_node
    end
    show_path(path, start, goal)
  end
  
  private 
  
  def show_path(path, start, goal)
    result = []
    path.each { |obj| result << obj.coords }
    result = result.reverse.unshift(start).push(goal)
    print "\n Congratulations ! You made it in #{result.length} moves! Here's your path : \n "
    p result
  end
end
