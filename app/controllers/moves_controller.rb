# TODO this should go away
class MovesController < ApplicationController

  def new
    @player = player
  end

  def create
    GameEngine.take_turn(player, direction.upcase)

    @player = player
    @resources = Game.get_resources_around_player(@player)

    respond_to do |format|
      format.html { render "new" }
    end
  end

  private
  def direction
    params[:direction]
  end

  def player
    Player.find(params[:player_id])
  end
end
