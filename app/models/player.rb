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

# I think I want to move these off
#  active        :boolean
#  days_active   :integer
#  x_location    :integer
#  y_location    :integer
#  water_count   :integer
#  food_count    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Player < ApplicationRecord
  validates :name, presence: true
  validates :water_stat, :food_stat, :movement_stat, :stamina_stat, presence: true
  validates_with PlayerValidator
  has_many :attempts
  has_one  :active_attempt, -> { where(active: true) }, :class_name=> "Attempt"

  after_create :start_attempt!

  def as_json(_)
    {
      id: id,
      x_location: active_attempt.x_location,
      y_location: active_attempt.y_location
    }
  end

  def start_attempt!
    Attempt.create!(player: self, active: true, days_active: 0, x_location: 0, y_location: 0, water_count: 5, food_count: 5)
  end

  def stat_total
    water_stat.to_i + food_stat.to_i + movement_stat.to_i + stamina_stat.to_i
  end

  def max_age
    active_attempt&.days_active || 0
  end

  def update_location!(location)
    active_attempt.update!(x_location: location.x, y_location: location.y)
  end

  def x
    active_attempt.x_location
  end
  
  def y
    active_attempt.y_location
  end
end
