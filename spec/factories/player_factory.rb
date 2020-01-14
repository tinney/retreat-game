# == Schema Information
#
# Table name: players
#
#  id                 :integer          not null, primary key
#  team_id            :integer
#  name               :string
#  water_stat         :integer          default(0), not null
#  food_stat          :integer          default(0), not null
#  stamina_stat       :integer          default(0), not null
#  active             :boolean          default(TRUE), not null
#  days_active        :integer          default(0), not null
#  days_without_water :integer          default(0), not null
#  days_without_food  :integer          default(0), not null
#  water_count        :integer          default(0), not null
#  food_count         :integer          default(0), not null
#  x_location         :integer          default(0), not null
#  y_location         :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :player do
    association :team
    name { 'Player 1' }
    water_stat { 5 }
    food_stat { 5 } 
    stamina_stat { 3 }
    x_location { 10 }
    y_location { 10 }
    active { true }
    water_count { 0 }
    food_count { 0 }
    #durability_stat 

    trait :inactive do
      active { false }
    end

    trait :active do
      active { true }
    end
  end
end
