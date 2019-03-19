require 'httparty'
require 'awesome_print'
require 'dotenv'
Dotenv.load

#Starter Code:
seven_wonders = ["Great Pyramid of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

BASE_URL = "https://us1.locationiq.com/v1/search.php?key=YOUR_PRIVATE_TOKEN&q=SEARCH_STRING&format=json"
key = ENV["LOCAL_IQ"]


# ap JSON.parse(response.body)

seven_wonders_locations = Hash.new

seven_wonders.map do |wonder|
  sleep(1)
  query_parameters = {
    'key': key,
    'q': wonder,
    'format': 'json'
  }
  response = HTTParty.get(BASE_URL, query: query_parameters)
  
  seven_wonders_locations[wonder] = { "lat" => response[0]["lat"], "lng" => response[0]["lon"] } 
end

ap seven_wonders_locations





#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
