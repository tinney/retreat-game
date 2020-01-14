require "rails_helper"

RSpec.feature "Game movement", type: :request do
  let(:headers) do
    {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
  end

  scenario "A Player can move across the board" do
    player = create(:player, stamina_stat: 1)

    old_x = player.x
    old_y = player.y
    old_days_active = player.days_active
    
    post "/players/#{player.id}/moves/", params: { direction: 'South' }, headers: headers

    player.reload

    expect(old_x).to equal(player.x)
    expect(old_y).to be < player.y
    expect(old_days_active).to be < player.days_active
  end

  scenario "A Player days_without_x (food/water) are updated when they have no food or water" do
    player = create(:player, food_count: 0, water_count: 0, stamina_stat: 4)
    
    post "/players/#{player.id}/moves/", params: { direction: 'South' }, headers: headers

    player.reload

    expect(player.days_without_food).to be(1)
    expect(player.days_without_water).to be(1)
    expect(player.active).to be_truthy
  end
  
  scenario "A Player without water should no longer be active" do
    player = create(:player, days_without_water: PlayerStatsUpdater::MAX_DAYS_WITHOUT_WATER, water_count: 0)
    
    post "/players/#{player.id}/moves/", params: { direction: 'South' }, headers: headers

    player.reload

    expect(player.active).to be_falsy
  end

  scenario "A Player without food should no longer be active" do
    player = create(:player, days_without_food: PlayerStatsUpdater::MAX_DAYS_WITHOUT_FOOD, food_count: 0)
    
    post "/players/#{player.id}/moves/", params: { direction: 'South' }, headers: headers

    player.reload

    expect(player.active).to be_falsy
  end

  scenario "A Player and a board are returned" do
    player = create(:player, x_location: 20, y_location: 10, water_count: 1)

    another_player = create(:player, :active, x_location: 20, y_location: 50)
    inactive_player = create(:player, :inactive, x_location: 20, y_location: 50)
    water_resource = create(:resource, :active, :water, x_location: 21, y_location: 20)
    food_resource = create(:resource, :active, :food, x_location: 21, y_location: 20)
    inactive_resource = create(:resource, :inactive, x_location: 20, y_location: 20)
    
    post "/players/#{player.id}/moves/", params: { direction: 'South' }, headers: headers

    parsed_response = JSON.parse(response.body)

    expect(parsed_response['player']['x']).to equal(20)
    expect(parsed_response['player']['y']).to equal(20) #starting y + move amount

    expect(parsed_response['board'].size).to equal(3)
  end
end