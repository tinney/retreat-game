require 'net/http'
require 'uri'
require 'json'




#BASE_URL = "http://retreat-game.herokuapp.com"
#TEAM_ID = "YOUR TEAM ID"

TEAM_ID = "22"

BASE_URL = "http://localhost:3000/api"
HEADERS = {'Content-Type' =>'application/json', 'TEAM' => TEAM_ID }

def create_player(name:, water_stat:, food_stat:, stamina_stat:, strength_stat:)
  uri = URI.parse("#{BASE_URL}/players/")
  http = Net::HTTP.new(uri.host, uri.port)

  req = Net::HTTP::Post.new(uri.path, HEADERS)
  req.body = {name: name, water_stat: water_stat, food_stat: food_stat, stamina_stat: stamina_stat, strength_stat: strength_stat}.to_json
  res = http.request(req)

  puts "response #{res.body}"
  puts JSON.parse(res.body)
  rescue => e
      puts "failed #{e}"
end

puts "Playing the game"
puts "Creating a player"
create_player(name: "Player w/ EQ Stats", water_stat: 5, food_stat: 5, stamina_stat: 5, strength_stat: 5)


# post to get a new player...  with food_size, water_size, stamina, ...
# res = Net::HTTP.post_form(uri, direction: 'SOUTH')
# puts res.body

# post to create a player for your team
# post /players/:id/moves, direction: 'NORTH SOUTH EAST WEST'

# request_body = { direction: "SOUTH" }

# # Create the HTTP objects
# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Post.new(uri.request_uri, header)
# request.body = request_body.to_json
# response = http.request(request)


# 300.times do
#   res = Net::HTTP.post_form(uri, direction: 'SOUTH')
# end
# puts res.body

