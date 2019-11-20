# frozen_string_literal: true

class GeocodeFetcher
  URL = 'https://eu1.locationiq.com/v1/search.php'

  attr_reader :response

  def initialize(query)
    @data = { 'key': ENV['GEO_TOKEN'], 'q': query, format: 'json' }
    @response = Faraday.get(URL, @data)
  end
end
