class Hero

  attr_accessor :name, :pos, :life, :gold

  def initialize hero
    self.name = hero['name']
    self.pos = hero['pos']
    self.life = hero['life']
    self.gold = hero['gold']
  end

end
