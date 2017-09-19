class Characters
  include SwapiAttribute

  def initialize(url)
    response = HTTParty.get(url)

    define_attributes(%w{name birth_year eye_color gender hair_color homeworld species starships}, response.parsed_response)
  end
end
