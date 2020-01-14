# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  x_location :integer          default(0), not null
#  y_location :integer          default(0), not null
#  active     :boolean          default(TRUE), not null
#  is_water   :boolean          default(FALSE), not null
#  is_food    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :on_x, -> (x) { where(x_location: x) }
  scope :on_y, -> (y) { where(y_location: y) }

  def as_json(_)
    {
      id: id,
      x: x_location,
      y: y_location,
      is_water: is_water,
      is_food: is_food,
    }
  end

  def is_player?
    false
  end

  def remove_resource!(amount_needed)
    return MAX_RESOURCE_AMOUNT if is_water?

    give_amount = [amount_needed, amount].min

    if amount_needed >= amount
      self.active = false
      self.amount = 0
    else
      self.amount -= amount_needed
    end

    save!

    return give_amount
  end
end
