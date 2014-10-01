class DanBot < BaseBot

  def move state
    game = Game.new state

    tiles = game.board.tiles
    graph = BoardGraph.new tiles

    DIRECTIONS[2]

  end

end

