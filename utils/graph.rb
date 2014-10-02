class BoardGraph

  attr_accessor :tiles, :nodes, :board

  def initialize board
    self.tiles = board.tiles
    self.board = board
    self.nodes = []
    build()
    connect()

    ## quick test
    #puts "#{self.nodes[5][5].tile}"
    #puts "#{self.nodes[5][5].connections.length}"
    #puts "#{self.nodes[5][5].passable}"
  end

  def build
    puts "building nodes"

    row = 0
    tiles.each {
      |x|
      boardrow = []
      column = 0
      x.each {
        |tile|

        node = BoardNode.new tile
        node.passable = self.board.passable? row, column
        node.x = row
        node.y = column
        boardrow.push(node)

        column += 1
      }

      row += 1
      self.nodes.push(boardrow)
    }

  end

  def connect
    puts "connecting nodes"
    row = 0
    width = nodes.length
    puts width
    nodes.each {
      |x|

      column = 0
      height = x.length
      x.each {
        |node|



        # This sucks lol
        if(column > 0)
          n = x[column - 1]
          node.connections.push(n)
        end

        if(column < width - 1)
          n = x[column + 1]
          node.connections.push(n)
        end
        
        if(row > 0)
          n = nodes[row - 1][column]
          node.connections.push(n)
        end

        if(row < height - 1)
          n = nodes[row + 1][column]
          node.connections.push(n)
        end

        column += 1
      }
      row += 1
    }

  end

end