class PlayerValidator < ActiveModel::Validator

  def validate(player)
    if player.stat_total > PLAYER_STAT_LIMIT
      player.errors[:base] << "You can only have up to #{PLAYER_STAT_LIMIT} stat points, you have #{player.stat_total}."
    end
  end
end