class Film
  include SwapiAttribute

  # Return all film objects by asking the API for them
  def self.all(films_url)
    response = HTTParty.get(films_url)
    json = JSON.parse(response.body)

    # Turn an array of hashes (results) into an array of 'Film' objects.
    json["results"].map { |hash| Film.new(hash) }
  end

  def initialize(details)
    @details = details

    define_attributes(%w{title opening_crawl}, details)
  end

  def characters
    @characters ||= @details["characters"]. map { |url| Characters.new(url) }
  end
end
