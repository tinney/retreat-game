class PlayersController < ApplicationController
  def create
    @team = team
    @player = @team.players.new(player_params)

    if @player.save 
      GameEngine.add_player(@player)

      respond_to do |format|
        format.html { redirect_to team_players_path(@team, @player) }
        format.json {
          @resources = Game.get_resources_around_player(@player)
          render json: @player.as_json(
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
    else
      render "new"
    end
  end

  def index
    @team = team
    @players = @team.players
  end

  def new
    @team = team
    @player = Player.new
  end

  def edit
    @team = team
  end

  def show
    @team = team
    @player = Player.find(params[:id])
  end

  private
  def player_params
    params.require(:player).permit(:name, :water_stat, :food_stat, :stamina_stat, :strength_stat)
  end

  def team
    Team.find params[:team_id]
  end
end
