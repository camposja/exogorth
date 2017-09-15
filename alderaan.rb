require 'httparty'
require 'json'
require 'awesome_print'

SWAPI_BASE_URL="http://swapi.co/api/"

# Running the command line "ruby alderaan.rb" will render a list of Star War movie titles to choose from.

# Get the root list of API endpoints
response = HTTParty.get(SWAPI_BASE_URL)
endpoints = JSON.parse(response.body)

film_endpoint = endpoints["films"]

response = HTTParty.get(film_endpoint)
films = JSON.parse(response.body)
ap films



# loop do
#   puts "** Which is the Coolest STAR WARS film? **
#   1.) The Phantom Menace
#   2.) Attack of the Clones
#   3.) Revenge of the Sith
#   4.) A New Hope
#   5.) The Empire Strikes Back
#   6.) Return of the Jedi
#   7.) The Force Awakens"
#   selection = gets.chomp
# end
#
# return selection
