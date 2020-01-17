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
      format.json {
        render json: {
          player: @player.as_json(
            only: [
              :water_count,
              :food_count,
              :days_without_water,
              :days_without_food,
              :active,
              :days_active
            ],
            methods: [:x, :y]
          ),
          board: @resources,
        }
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
