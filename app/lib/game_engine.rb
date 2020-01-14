class GameEngine
  def self.add_player(player)
    GameBroadcaster.broadcast_player_created(player)
  end

  def self.take_turn(player, direction)
    location = MoveCalculator.calculate_move(current_x: player.x, current_y: player.y, direction: direction)

    resources = Game.get_resources_at_location(x: location.x, y: location.y)
    GameColliderHandler.handle_collisions(player, resources)
    PlayerStatsUpdater.update_for_turn(player, location)
    GameBroadcaster.broadcast_player_moved(player)
  end
end

