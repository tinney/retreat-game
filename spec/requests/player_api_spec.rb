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
      food_stat: 4,
      water_stat: 3,
      stamina_stat: 2,
      strength_stat: 1,
    }

    post "/teams/#{team.id}/players/", params: { player: player_params }, headers: headers

    parsed_response = JSON.parse(response.body)

    expect(parsed_response['active']).to be_truthy
    expect(parsed_response['days_active']).to be(0)
    expect(parsed_response['days_without_water']).to be(0)
    expect(parsed_response['days_without_food']).to be(0)
    expect(parsed_response['water_count']).to be(3)
    expect(parsed_response['food_count']).to be(4)

    expect(parsed_response['x']).to be_truthy
    expect(parsed_response['y']).to be_truthy
  end
end