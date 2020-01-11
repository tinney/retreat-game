class GameBroadcaster
  def self.broadcast_player_moved(player)
    ActionCable.server.broadcast(
      "players",
      player_id: player.id, 
      x: player.x, 
      y: player.y,
    )
  end
end
