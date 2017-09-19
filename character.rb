class Characters
  include SwapiAttribute

  def initialize(url)
    response = HTTParty.get(url)
    details = JSON.parse(response.body)

    define_attributes(%w{name birth_year eye_color gender hair_color homeworld species starships}, details)
  end
end
