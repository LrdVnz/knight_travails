# frozen_string_literal: true

# Position class for the moves of the knight
class Position
  attr_reader :coords, :adj_list, :previous_node

  def initialize(coords)
    @coords = coords
    @adj_list = []
  end
  
  public 
  
  def add_adjacent(node)
    adj_list << node
  end

  def previous(node)
    @previous_node = node
  end
end
