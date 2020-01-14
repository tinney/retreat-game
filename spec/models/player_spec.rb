# == Schema Information
#
# Table name: players
#
#  id                 :integer          not null, primary key
#  team_id            :integer
#  water_stat         :integer          default(0), not null
#  food_stat          :integer          default(0), not null
#  movement_stat      :integer          default(0), not null
#  stamina_stat       :integer          default(0), not null
#  active             :boolean          default(TRUE), not null
#  days_active        :integer          default(0), not null
#  days_without_water :integer          default(0), not null
#  days_without_food  :integer          default(0), not null
#  water_count        :integer          default(0), not null
#  food_count         :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

RSpec.describe 'Player' do
  context 'validations' do
    it 'limits the total stats to 20' do
      subject = build(:player, water_stat: 30)
      expect(subject).to_not be_valid
    end

    it 'requires defaults stats' do
      subject = build(:player, water_stat: nil)
      expect(subject).not_to be_valid
    end

    it 'creates a move when started' do
      subject = create(:player)
      expect(subject.moves.size).to equal(1)
    end
  end
end
