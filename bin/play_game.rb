require 'net/http'
require 'uri'
require 'json'

puts "Starting the game"


# post to get a new player...  with food_size, water_size, stamina, ...
player_id = 2
uri = URI.parse("http://localhost:3000/players/#{player_id}/moves")
header = {'Content-Type': 'text/json'}
res = Net::HTTP.post_form(uri, direction: 'SOUTH')

# post to create a player for your team
# post /players/:id/moves, direction: 'NORTH SOUTH EAST WEST'

# request_body = { direction: "SOUTH" }

# # Create the HTTP objects
# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Post.new(uri.request_uri, header)
# request.body = request_body.to_json
# response = http.request(request)


300.times do
  res = Net::HTTP.post_form(uri, direction: 'SOUTH')
end
puts res.body