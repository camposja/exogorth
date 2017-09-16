require 'httparty'
require 'json'
require_relative 'ap'

SWAPI_BASE_URL="http://swapi.co/api/"

# Running the command line "ruby alderaan.rb" will render a list of Star War movie titles to choose from.

# Get the root list of API endpoints
response = HTTParty.get(SWAPI_BASE_URL)
urls = JSON.parse(response.body)

film_url = urls["films"]

response = HTTParty.get(film_url)
json = JSON.parse(response.body)
films = json["results"]

films.each_with_index do |film, index|
  puts "#{index + 1} - #{film["title"]}"
end

print "What film do you want informaion on? "
choice = gets.chomp.to_i
puts "You chose #{choice}"
