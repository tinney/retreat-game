class MovesController < ApplicationController

  def new
    @player = player
  end

  def create
    PlayerMover.move_player(player, direction)
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
