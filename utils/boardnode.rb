class BoardNode

  attr_accessor :tile, :connections

  def initialize tile
    self.tile = tile
    self.connections = []
  end

end