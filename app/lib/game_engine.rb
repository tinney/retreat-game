class GameEngine
  def self.take_turn(player, location)
    player.update_location!(location)
    handle_collisions(player)
    update_stats(player)
  end

  private
  def self.handle_collisions(player)
  end
  
  def self.update_stats(player)
    # days lived
    # active / inactive
  end
end

