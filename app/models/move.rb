# == Schema Information
#
# Table name: moves
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  x_location :integer
#  y_location :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Move < ApplicationRecord
end
