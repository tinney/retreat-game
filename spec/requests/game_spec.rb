require "rails_helper"

RSpec.feature "Game movement", type: :request do
  scenario "A Player can move across the board" do
    player = create(:player)
    post "/players/#{player.id}/moves/", params: { direction: 'North' }

    expect(response.body).to include("hello")
  end
end