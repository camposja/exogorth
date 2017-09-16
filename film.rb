class Film
  attr_reader :title, :opening_crawl

  def initialize(hash)
    @hash = hash

    @title = hash["title"]
    @opening_crawl = hash["opening_crawl"]
    @characters = hash["characters"]
  end

  def characters
    @hash["characters"]. map { |url| Characters.new(url) }
  end
end
