# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  def self.get_resources_at_location(x:, y:)
    []
  end
end
