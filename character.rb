class Characters
  attr_reader :name
  
  def initialize(url)
    response = HTTParty.get(url)
    details = JSON.parse(response.body)

    @name = details["name"]
  end
end
