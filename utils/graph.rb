class BoardGraph

  attr_accessor :tiles, :nodes

  def initialize tiles
    self.tiles = tiles
    self.nodes = []
    build()
    connect()

    ## quick test
    puts "#{self.nodes[4][0].tile}"
    puts "#{self.nodes[4][0].connections.length}"
  end

  def build
    puts "building nodes"

    index = 0
    tiles.each {
      |x|
      row = []
      x.each {
        |tile|
        index+=1
        node = BoardNode.new tile
        row.push(node)
      }
      self.nodes.push(row)
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
        column += 1


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

        if(row > height - 1)
          n = nodes[row + 1][column]
          node.connections.push(n)
        end
      }
      row += 1
    }

  end

end