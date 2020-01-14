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

  scenario "A Player days without food and water are updated when they have no food or water" do
    player = create(:player, food_count: 0, water_count: 0)
    
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
end