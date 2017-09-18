class Film
  attr_reader :title, :opening_crawl

  # Return all film objects by asking the API for them
  def self.all(films_url)
    response = HTTParty.get(films_url)
    json = JSON.parse(response.body)

    # Turn an array of hashes (results) into an array of 'Film' objects.
    json["results"].map { |hash| Film.new(hash) }
  end

  def initialize(hash)
    @hash = hash

    @title = hash["title"]
    @opening_crawl = hash["opening_crawl"]
  end

  def characters
    @characters ||= @hash["characters"]. map { |url| Characters.new(url) }
  end
end
