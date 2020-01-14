class GamesController < ApplicationController
  def index
    @players = Player.all
    @resources = Resource.all.active
  end
end
