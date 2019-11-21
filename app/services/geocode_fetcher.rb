# frozen_string_literal: true

class GeocodeFetcher
  URL = 'https://eu1.locationiq.com/v1/search.php'

  def initialize(query)
    @data = { 'key': ENV['GEO_TOKEN'], 'q': query, format: 'json' }
    @response = Rails.cache.fetch(query) do
      Faraday.get(URL, @data)
    end
  end

  def response
    Rails.cache.fetch(@response) do
      @response
    end
  end
end
