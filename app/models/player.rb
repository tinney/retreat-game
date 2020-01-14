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

class Player < ApplicationRecord
  START_X = 0 
  START_Y = 0 

  validates :team_id, :water_stat, :food_stat, :movement_stat, :stamina_stat, presence: true
  validates_with PlayerValidator
  belongs_to :team
  has_many :moves

  after_create :start_move!

  def has_water?
    water_count > 0
  end
  j
  def has_food?
    food_count > 0
  end

  def eat
    return unless has_food?
    self.food_count = food_count - 1
  end

  def drink 
    return unless has_water?
    self.water_count = water_count - 1
  end

  def as_json(_)
    {
      id: id,
      x: x,
      y: y,
    }
  end

  def start_move!
    self.moves.create!(x_location: rand(MoveCalculator::BOARD_WIDTH), y_location: rand(MoveCalculator::BOARD_HEIGHT))
  end

  def stat_total
    water_stat.to_i + food_stat.to_i + movement_stat.to_i + stamina_stat.to_i
  end

  def update_location!(location)
    moves.create!(x_location: location.x, y_location: location.y)
  end

  def x
    moves.last.x_location
  end
  
  def y
    moves.last.y_location
  end

  def increase_days_active!
    update!(days_active: 1 + days_active)
  end
end
