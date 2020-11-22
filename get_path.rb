# frozen_string_literal: true

# Class for getting the path taken.
module GetPath
  def get_path(previous_nodes, start, goal)
    list = previous_nodes.uniq
    current = list.last
    @path = []
    while current != list.first
      @path << current
      current = current.previous_node
    end
    show_path(start, goal)
  end

  private 
  
  def show_path(start, goal)
    result = []
    @path.each { |obj| result << obj.coords }
    result = result.reverse.unshift(start).push(goal)
    print "\n Congratulations ! You made it in #{result.length} moves! Here's your path : \n "
    p result
  end
end
