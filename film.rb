class Film
  # Return all film objects by asking the API for them
  def self.all(films_url)
    response = HTTParty.get(films_url)
    json = JSON.parse(response.body)

    # Turn an array of hashes (results) into an array of 'Film' objects.
    json["results"].map { |hash| Film.new(hash) }
  end

  def initialize(details)
    @details = details

    %w{title opening_crawl}.each do |attribute|
      define_singleton_method(attribute) do
        details[attribute]
      end
    end
  end

  def characters
    @characters ||= @details["characters"]. map { |url| Characters.new(url) }
  end
end
