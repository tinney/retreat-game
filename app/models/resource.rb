# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  x_location :integer          default(0), not null
#  y_location :integer          default(0), not null
#  active     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
  scope :active, -> { where(active: true) }

  def as_json(_)
    {
      id: id,
      x: x_location,
      y: y_location,
      water: true, # TODO to be real
      food: false
    }
  end
end
