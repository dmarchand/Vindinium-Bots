class DanBot < BaseBot


  attr_accessor :path, :pathIndex

  def initialize

  end

  def move state
    game = Game.new state


    me = game.heroes[0]

    graph = BoardGraph.new game.board

    if(self.path.nil? || self.pathIndex >= self.path.length )

      astar = AStarPathFinder.new graph
      self.path = astar.findpath(me.pos['x'], me.pos['y'], 6, 6)
      self.pathIndex = 0

      # Debug
      #puts "Path ahoy!"
      #self.path.each { |x| puts "#{x.x}, #{x.y}" }
    end

    direction = DIRECTIONS[0]

    x = me.pos['x']
    y = me.pos['y']

    nextNode = self.path[self.pathIndex]

    if(nextNode.nil?)
      direction = DIRECTIONS[0]
    else
      if(y < nextNode.y)
        direction = DIRECTIONS[3]
      end

      if(y > nextNode.y)
        direction = DIRECTIONS[4]
      end

      if(x < nextNode.x)
        direction = DIRECTIONS[2]
      end

      if(x > nextNode.x)
        direction = DIRECTIONS[1]
      end
      puts "At #{x}, #{y}. Moving to: #{nextNode.x}, #{nextNode.y} (#{direction})"
    end

    self.pathIndex += 1



    direction

  end

end

