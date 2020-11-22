# frozen_string_literal: true

load 'position.rb'
load 'moves.rb'
load 'board.rb'
load 'get_path.rb'

# Knight class. Holds main function "moveto"
class Knight < Moves
  include GetPath
  attr_reader :moves, :arrays

  def initialize
    super
    @moves = Moves.new.list
    @arrays =
      {
        'queue' => [],
        'visited' => [],
        'previous_nodes' => []
      }
  end

  def moveto(start, goal)
    moveto_init(start, goal)
    loop do
      current = take_current
      return get_path(arrays['previous_nodes'], start, goal) if start == goal

      8.times do |number|
        move_result = get_move_result(current, number)
        return get_path(arrays['previous_nodes'], start, goal) if !move_result.nil? && move_result.coords == goal
      end
    end
  end

  def moveto_init(start, goal)
    print "\n Calculating shortest path from #{start} to #{goal} .... \n"
    current = Position.new(start)
    arrays['queue'] << current
  end

  def take_current
    current = arrays['queue'].shift
    arrays['visited'] << current
    current
  end

  def get_move_result(current, number)
    move_result = make_move(moves[number], current.coords)
    move_result_push(move_result, current) unless move_result.nil?
  end

  def move_result_push(move_result, current)
    move_result = Position.new(move_result)
    push_to_arr(current, move_result) unless arrays['visited'].include?(move_result)
    move_result
  end

  def push_to_arr(current, move_result)
    arrays['previous_nodes'] << move_result.previous(current)
    arrays['queue'] << move_result
    arrays['visited'] << move_result
  end
end

k = Knight.new
Board.new
k.moveto([3, 3], [3, 4])
