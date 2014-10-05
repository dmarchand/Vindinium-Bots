class BoardNode

  attr_accessor :tile, :connections, :passable, :x, :y, :parentNode, :g, :h, :f, :weight

  def initialize tile
    self.tile = tile
    self.connections = []
    self.f = 0
    self.g = 0
    self.h = 0
    self.weight = 0
  end

end