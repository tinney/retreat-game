class Api::PlayersController < Api::ApplicationController
  def create

    player = team.players.new(player_params)

    if player.save 
      respond_to do |format|
        format.json {
          #resources = resources_for_player(player),
          render json: player.as_json(
            only: [
              :water_count,
              :food_count,
              :days_without_water,
              :days_without_food,
              :active,
              :days_active
            ],
            methods: [:x, :y]
          )
        }
      end
    end
  end

  def show
    player = team.players.find(params[:id])

    respond_to do |format|
      format.json {
        #resources = resources_for_player(player),
        render json: player.as_json(
          only: [
            :water_count,
            :food_count,
            :days_without_water,
            :days_without_food,
            :active,
            :days_active
          ],
          methods: [:x, :y]
        )
      }
    end
  end

  private
  def resources_for_player(player)
    Game.get_resources_around_player(player)
  end

  def player_params
    params.require(:player).permit(:name, :water_stat, :food_stat, :stamina_stat, :strength_stat)
  end
end
