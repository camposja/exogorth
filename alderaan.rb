require 'httparty'
require 'json'

SWAPI_BASE_URL="http://swapi.co/api/"

response = HTTParty.get(SWAPI_BASE_URL)

loop do
  puts "** Which is the Coolest STAR WARS film? **
  1.) The Phantom Menace
  2.) Attack of the Clones
  3.) Revenge of the Sith
  4.) A New Hope
  5.) The Empire Strikes Back
  6.) Return of the Jedi
  7.) The Force Awakens"
  selection = gets.chomp
end

return selection
