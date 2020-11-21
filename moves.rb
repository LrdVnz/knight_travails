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

  def get_move(move_number)
    @list[move_number]
  end

  def make_move(move, pos)
    if check_move(move, pos)
      nil
    else
      result = []
      result[0] = pos[0] + move[0]
      result[1] = pos[1] + move[1]
      result
    end
  end

  def check_move(move, pos)
    (pos[0] + move[0]).negative? || (pos[0] + move[0]) > 7 || (pos[1] + move[1]).negative? || (pos[1] + move[1]) > 7
  end

end
