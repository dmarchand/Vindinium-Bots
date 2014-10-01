class BoardNode

  attr_accessor :tile, :connections, :passable

  def initialize tile
    self.tile = tile
    self.connections = []
  end

end