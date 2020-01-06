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

FactoryBot.define do
  factory :player do
    name { 'Todd & Justin' }
    water_stat { 1 }
    food_stat { 1 }
    movement_stat { 1 }
    stamina_stat { 1 }
  end
end
