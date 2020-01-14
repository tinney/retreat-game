class GameColliderHandler
  def self.handle_collisions(player, resources)
    resources.each do |resource|
      if resource.is_water?
        player.fill_water!(resource.amount)
      elsif resource.is_food?
        food = resource.remove_resource!(player.food_amount_needed)
        player.fill_food!(food)
      elsif resource.is_player?
      else
        raise "unknown resource"
      end
    end
  end

end