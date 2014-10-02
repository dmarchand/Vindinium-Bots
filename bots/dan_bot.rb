class DanBot < BaseBot

  def move state
    game = Game.new state


    graph = BoardGraph.new game.board

    astar = AStarPathFinder.new graph
    astar.findpath(0, 2, 6, 6)

    DIRECTIONS[2]

  end

end

