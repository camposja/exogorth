require 'httparty'
require 'json'
require_relative 'ap'
require_relative 'swapi_attribute'
require_relative 'film'
require_relative 'character'


# Running the command line "ruby alderaan.rb" will render a list of Star War movie titles to choose from.

class Menu
  SWAPI_BASE_URL="http://swapi.co/api/"

  def initialize
    # Get the root list of API endpoints
    response = HTTParty.get(SWAPI_BASE_URL)
    urls = JSON.parse(response.body)

    @films = Film.all(urls["films"])
  end

  def show_choices(array_of_things, zero_message, choice_message)
    puts "0 - Exit"
    array_of_things.each_with_index do |thing, index|
      print "#{index + 1}"
      yield thing
    end

    print choice_message

    gets.chomp.to_i
  end

  def main_menu
    loop do
      choice = show_choices(@films, "0 - Exit", "What movie do you want information on? ") do |film|
        puts " - #{film.title}"
      end

      if choice == 0
        return
      end

      # When a user selects a title, they are presented with the opening crawl for the movie
      # and asked if they would like to learn more or select another title.
      show_film(@films[choice - 1])
    end
  end

  def show_film(film_to_show)
    puts film_to_show.opening_crawl

    loop do
      print "Learn more? [y/n]: "
      choice = gets.chomp.downcase
      if choice == 'n'
        return
      end

      choice = show_choices(film_to_show.characters, "", "Choose a character: ") do |character|
        puts " - #{character.name}"
      end

      show_bio(film_to_show.characters[choice - 1])
    end
  end

  def show_bio(character)
    puts "The character's name is: #{character.name}"
    puts "The character's birth year is: #{character.birth_year}"
    puts "The character's eye color is: #{character.eye_color}"
    puts "The character's gender is: #{character.gender}"
    puts "The character's hair color is: #{character.hair_color}"
    puts "The character's Homeworld is: #{character.homeworld}"
    puts "The character's Species is: #{character.species}"
    puts "The character's Starships are: #{character.starships}"
  end
end

menu = Menu.new
menu.main_menu
