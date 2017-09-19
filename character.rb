class Characters
  def initialize(url)
    response = HTTParty.get(url)
    details = JSON.parse(response.body)

    %w{name birth_year eye_color gender hair_color homeworld species starships}.each do |attribute|
      define_singleton_method(attribute) do
        details[attribute]
      end
    end
  end
end
