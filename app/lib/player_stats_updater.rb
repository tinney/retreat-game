class PlayerStatsUpdater
  MAX_DAYS_WITHOUT_WATER = 5
  MAX_DAYS_WITHOUT_FOOD = 21

  def self.update_for_turn(player)
    player.days_without_water = days_without_water(player)
    player.days_without_food = days_without_food(player)

    player.eat
    player.drink

    player.days_active =  player.days_active + 1
    player.active = active?(player)

    player.save!
  end

  def self.active?(player)
    (player.days_without_water <= MAX_DAYS_WITHOUT_WATER && player.days_without_food <= MAX_DAYS_WITHOUT_FOOD)
  end

  def self.days_without_water(player)
    if player.has_water?
      0
    else
      player.days_without_water + 1
    end
  end

  def self.days_without_food(player)
    if player.has_food?
      0
    else
      player.days_without_food + 1
    end
  end
end