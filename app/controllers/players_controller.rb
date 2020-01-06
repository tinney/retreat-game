class PlayersController < ApplicationController
  def create
    @player = Player.new(player_params)
    if @player.save
      @player.start_attempt!
      redirect_to @player
    else
      render "new"
    end
  end

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def show
    @player = Player.find(params[:id])
  end

  private
  def player_params
    params.require(:player).permit(:name, :water_stat, :food_stat, :movement_stat, :stamina_stat)
  end
end
