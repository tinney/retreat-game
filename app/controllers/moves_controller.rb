class MovesController < ApplicationController

  def new
    @player = player
  end

  def create
    location = PlayerMover.calculate_move(current_x: player.x, current_y: player.y, direction: direction)
    GameEngine.take_turn(player, location)
    GameBroadcaster.broadcast_player_moved(player)

    @player = player
    render "new"
  end

  private
  def direction
    params[:direction]
  end

  def player
    Player.find(params[:player_id])
  end
end
