class PlayerMover
  BOARD_HEIGHT = 800 # NOTE this is also set in game.js
  BOARD_WIDTH = 800 # NOTE this is also set in game.js
  MOVE_AMOUNT = 10

  NORTH = 'North'.freeze
  EAST = 'East'.freeze
  SOUTH = 'South'.freeze
  WEST = 'West'.freeze

  def self.move_player(player, direction)
    player
    attempt = player.active_attempt
    x = attempt.x_location
    y = attempt.y_location

    if direction == NORTH
      y -= MOVE_AMOUNT
      y = BOARD_HEIGHT - MOVE_AMOUNT if y < 0
    elsif direction == SOUTH
      y += MOVE_AMOUNT
      y = 0 if y > BOARD_HEIGHT
    elsif direction == EAST
      x += MOVE_AMOUNT
      x = 0 if x > BOARD_WIDTH
    elsif direction == WEST
      x -= MOVE_AMOUNT
      x = BOARD_WIDTH - MOVE_AMOUNT if x < 0
    else
      raise "unknown direction '#{direction}'"
    end

    attempt.update!(x_location: x, y_location: y)
    player_id = player.id
    broadcast_move_to_channel(player_id, x, y)
  end

  def self.broadcast_move_to_channel(player_id, x, y)
    ActionCable.server.broadcast(
      "players",
      player_id: player_id, 
      x: x, 
      y: y,
    )
  end
end