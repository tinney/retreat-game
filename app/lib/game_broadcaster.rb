class GameBroadcaster
  def self.log(message)
    return unless Rails.env.development?
    puts "=" * 100 
    puts "=" * 100 
    puts message 
    puts "=" * 100 
    puts "=" * 100 
  end

  def self.broadcast_player_created(player)
    log "broadcast player created"
    ActionCable.server.broadcast(
      "players",
      action: 'created',
      is_player: true, 
      is_water: false, 
      is_food: false,
      id: player.id, 
      x: player.x, 
      y: player.y,
    )
  end

  def self.broadcast_resource_created(resource)
    log "broadcasting resource created"
    ActionCable.server.broadcast(
      "players",
      action: 'created',
      id: resource.id, 
      is_player: false, 
      is_water: resource.is_water?, 
      is_food: resource.is_food?,
      x: resource.x, 
      y: resource.y,
    )
  end

  def self.broadcast_resource_destroyed(resource)
    log "resource destroyed"
    ActionCable.server.broadcast(
      "players",
      action: 'destroyed',
      id: resource.id, 
      is_player: false, 
      is_water: resource.is_water?, 
      is_food: resource.is_food?,
    )
  end

  def self.broadcast_player_died(player)
    log "broadcast player destroyed"
    ActionCable.server.broadcast(
      "players",
      action: 'destroyed',
      id: player.id, 
      is_player: true, 
      is_water: false,
      is_food: false,
    )
  end
  
  def self.broadcast_player_moved(player)
    log "broadcast player moved"
    ActionCable.server.broadcast(
      "players",
      action: 'moved',
      id: player.id, 
      x: player.x, 
      y: player.y,
    )
  end
end
