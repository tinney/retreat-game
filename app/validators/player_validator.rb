class PlayerValidator < ActiveModel::Validator
  STAT_LIMIT = 20.freeze

  def validate(player)
    if player.stat_total > STAT_LIMIT
      player.errors[:base] << "You can only have up to #{STAT_LIMIT} stat points, you have #{player.stat_total}."
    end
  end
end