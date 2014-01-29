class Bot

  DIRECTIONS = %w{Stay North South East West} 

end

class RandomBot < Bot

  def move state
    #game = Game.new state
    DIRECTIONS.sample
  end

end

class FighterBot < Bot

  def move state
    DIRECTIONS.sample
  end

end

class SlowBot < Bot

  def move state
    sleep 2
    DIRECTIONS.sample
  end

end
