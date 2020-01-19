class GameBroadcaster
  def self.broadcast_player_created(player)
    ActionCable.server.broadcast(
      "players",
      action: 'created',
      id: player.id, 
      x: player.x, 
      y: player.y,
    )
  end

  def self.broadcast_player_died(player)
    ActionCable.server.broadcast(
      "players",
      action: 'died',
      id: player.id, 
    )
  end
  
  def self.broadcast_player_moved(player)
    ActionCable.server.broadcast(
      "players",
      action: 'moved',
      id: player.id, 
      x: player.x, 
      y: player.y,
    )
  end
end
