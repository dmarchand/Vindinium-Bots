class DanBot < BaseBot

  def move state
    game = Game.new state


    graph = BoardGraph.new game.board

    astar = AStarPathFinder.new graph
    path = astar.findpath(0, 2, 6, 6)

    # Debug
    puts "Path ahoy!"
    path.each { |x| puts "#{x.x}, #{x.y}" }

    DIRECTIONS[2]

  end

end

