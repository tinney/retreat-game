require 'rails_helper'

RSpec.describe 'GameColliderHandler' do
  describe '#handle_collisions' do
    let(:water_stat) { 5 }
    let(:food_stat) { 5 }
    let(:days_active) { 100 }

    let(:player) { create(:player, food_count: 0, water_count: 0, food_stat: food_stat, water_stat: water_stat, stamina_stat: 1, days_active: days_active ) }
    
    context 'when there is no resources for the location' do
      let(:resources) { [] }
      it 'does nothing' do
        GameColliderHandler.handle_collisions(player, resources)
        expect(player.food_count).to equal(0)
        expect(player.water_count).to equal(0)
      end
    end
    
    context 'when the resource is water' do
      let(:resources) { [create(:resource, is_water: true, amount: 100)] }
      it 'fills the players water' do
        GameColliderHandler.handle_collisions(player, resources)
        expect(player.food_count).to equal(0)
        expect(player.water_count).to equal(water_stat)
      end
    end

    context 'when the resource is food' do
      let(:resources) { [resource] }
      let(:resource) { create(:resource, is_food: true, is_water: false, amount: 3, active: true) }

      it 'fills the players water' do
        player = create(:player, water_count: 0, food_count: 1, food_stat: 5)
        GameColliderHandler.handle_collisions(player, resources)

        resource.reload

        expect(player.food_count).to equal(4)
        expect(player.water_count).to equal(0)

        expect(resource.amount).to equal(0)
        expect(resource.active).to equal(false)
      end
    end
  end
end