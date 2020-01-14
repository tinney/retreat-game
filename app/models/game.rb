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
    Resource.where(active: true, x_location: x, y_location: y) + Player.where(x_location: x, y_location: y).all
  end

  def self.get_resources_around_player(player)
    x = player.x
    y = player.y

    Resource.on_x(x).or(Resource.on_y(y)).active.all +
    Player.on_x(x).or(Player.on_y(y)).active.where.not(id: player.id).all
  end
end
