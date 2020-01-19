require 'net/http'
require 'uri'
require 'json'




#BASE_URL = "http://retreat-game.herokuapp.com"
#TEAM_ID = "YOUR TEAM ID"

TEAM_ID = "22"

BASE_URL = "http://localhost:3000/api"
HEADERS = {'Content-Type' =>'application/json', 'TEAM' => TEAM_ID }

def make_request(api_endpoint, request_body)
  uri = URI.parse("#{BASE_URL}/#{api_endpoint}/")
  http = Net::HTTP.new(uri.host, uri.port)

  req = Net::HTTP::Post.new(uri.path, HEADERS)
  req.body = request_body.to_json
  res = http.request(req)

  return JSON.parse(res.body)
  
  rescue => e
    puts "failed #{e}"
end

puts "Playing the game"
puts "Creating a player"
response = make_request("players", {name: "Player w/ EQ Stats", water_stat: 5, food_stat: 5, stamina_stat: 5, strength_stat: 5})

puts "Moving the player around"

active = true

while(active)
  direction = ["NORTH", "SOUTH", "EAST", "WEST"].sample(1).first
  response = make_request("moves", { direction: "North" })
  puts response
  actve = response["player"]["active"]
  sleep(0.5)
end