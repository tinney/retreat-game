require "rails_helper"

RSpec.feature "Creating a Player API", type: :request do
  let(:headers) do
    {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
  end

  scenario "A Player and a board are returned" do
    team = create(:team)
    player_params = {
      food_stat: 1,
      water_stat: 2,
      stamina_stat: 3,
      strength_stat: 4,
    }

    post "/teams/#{team.id}/players/", params: { player: player_params }, headers: headers

    parsed_response = JSON.parse(response.body)
    binding.pry
  end
end