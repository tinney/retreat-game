class MovesController < ApplicationController

  def new
    @player = player
  end

  def create
    GameEngine.take_turn(player, direction.upcase)
    @player = player

    respond_to do |format|
      format.html { render "new" }
      format.json {
        render json: @player.to_json
      }
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
