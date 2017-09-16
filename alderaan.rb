require 'httparty'
require 'json'
require_relative 'ap'



# Running the command line "ruby alderaan.rb" will render a list of Star War movie titles to choose from.

class Menu
  SWAPI_BASE_URL="http://swapi.co/api/"

  def initialize
    # Get the root list of API endpoints
    response = HTTParty.get(SWAPI_BASE_URL)
    urls = JSON.parse(response.body)

    film_url = urls["films"]

    response = HTTParty.get(film_url)
    json = JSON.parse(response.body)
    @films = json["results"]
  end

  def main_menu
    loop do
      puts "0 - exit"
      @films.each_with_index do |film, index|
        puts "#{index + 1} - #{film["title"]}"
      end

      print "What film do you want informaion on? "
      choice = gets.chomp.to_i
      if choice == 0
        exit
      end

      # When a user selects a title, they are presented with the opening crawl for the movie
      # and asked if they would like to learn more or select another title.

      film = @films[choice - 1]

      show_film(film)
    end
  end

  def show_film(film_to_show)
    puts film_to_show["opening_crawl"]

    print "Learn more? [y/n]: "
    choice = gets.chomp.downcase
    if choice == "y"
      # show more
      # they get a list of characters presented.
      characters = film_to_show["characters"]

      characters.each do |character|
        puts character
      end
    end
  end
end

menu = Menu.new
menu.main_menu
