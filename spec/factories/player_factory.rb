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

FactoryBot.define do
  factory :player do
    association :team
    water_stat { 5 }
    food_stat { 5 } 
    movement_stat { 3 }
    stamina_stat { 3 }
  end
end
