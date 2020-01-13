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
#  active             :boolean
#  days_active        :integer
#  days_without_water :integer
#  days_without_food  :integer
#  water_count        :integer
#  food_count         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :player do
    association :team
    water_stat { 5 }
    food_stat { 5 } 
    movement_stat { 3 }
    stamina_stat { 3 }
  end
end
