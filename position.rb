# frozen_string_literal: true

# Position class for the moves of the knight
class Position
  attr_reader :coords, :previous_node

  def initialize(coords)
    @coords = coords
  end

  def previous(node)
    @previous_node = node
  end
end
