# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  game_id       :integer
#  water_stat    :integer          default(0)
#  food_stat     :integer          default(0)
#  movement_stat :integer          default(0)
#  stamina_stat  :integer          default(0)
#  active        :boolean
#  days_active   :integer
#  x_location    :integer
#  y_location    :integer
#  water_count   :integer
#  food_count    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

RSpec.describe 'Player' do
  context 'validations' do
    it 'limits the total stats to 20' do
      subject = build(:player, water_stat: 30)
      expect(subject).to_not be_valid
    end

    it 'requires a name' do
      subject = build(:player, name: '')
      expect(subject).to_not be_valid
    end

    it 'requires defaults stats' do
      subject = build(:player, water_stat: nil)
      expect(subject).not_to be_valid
    end
  end
end
