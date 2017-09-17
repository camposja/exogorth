class Characters
  attr_reader :name, :birth_year, :homeworld, :species, :starships

  def initialize(url)
    response = HTTParty.get(url)
    details = JSON.parse(response.body)

    @name = details["name"]
    @birth_year = details["birth_year"]
    @homeworld = details["homeworld"]
    @species = details["species"]
    @starships = details["starships"]
  end
end
