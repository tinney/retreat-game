class PlayersChannel < ApplicationCable::Channel
  def subscribed
    puts "=" * 100
    puts "=" * 100
    stream_from "players"
    puts "streaming players"
    puts "=" * 100
    puts "=" * 100
  end
end