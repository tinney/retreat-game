require "rails_helper"

RSpec.feature "Creating a Player API", type: :request do
  let(:headers) do
    {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json", # This is what Rails 3 accepts
      "TEAM" => team_id 
    }
  end

  let(:team) { create(:team) }
  let(:team_id) { team.id }

  context "Without a team id" do
    let(:team_id) { nil }
    
    scenario "Raises an error without a team" do
      player_params = {
        name: "My Player",
        food_stat: 4,
        water_stat: 3,
        stamina_stat: 2,
        strength_stat: 1,
      }

      post "/api/players/", params: { player: player_params }, headers: headers

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).to be_truthy
      expect(parsed_response['error']).to eq("No Team ID passed in request header")
    end
  end

  context "With a missing team id" do
    let(:team_id) { 99 }
    
    scenario "Raises an error without a team" do
      player_params = {
        name: "My Player",
        food_stat: 4,
        water_stat: 3,
        stamina_stat: 2,
        strength_stat: 1,
      }

      post "/api/players/", params: { player: player_params }, headers: headers

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).to be_truthy
      expect(parsed_response['error']).to eq("Team not found for ID 99")
    end
  end

  scenario "A Player and a board are returned" do
    player_params = {
      name: "My Player",
      food_stat: 4,
      water_stat: 3,
      stamina_stat: 2,
      strength_stat: 1,
    }

    post "/api/players/", params: { player: player_params }, headers: headers

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