class BoardNode

  attr_accessor :tile, :connections, :passable, :x, :y, :parentNode, :weight

  def initialize tile
    self.tile = tile
    self.connections = []
    self.weight = 99
  end

  def compareTo node
    if(node.weight < self.weight)
      return false
    end

    true
  end
end