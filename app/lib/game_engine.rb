class GameEngine
  def self.take_turn(player, direction)
    location = MoveCalculator.calculate_move(current_x: player.x, current_y: player.y, direction: direction)

    player.update_location!(location)
    location = Game.get_location(x: player.x, y: player.y)
    GameColliderHandler.handle_collisions(player, location)
    PlayerStatsUpdater.update_for_turn(player)
    GameBroadcaster.broadcast_player_moved(player)
  end
end

