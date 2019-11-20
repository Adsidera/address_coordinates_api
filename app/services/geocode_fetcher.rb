# frozen_string_literal: true

require 'colorize'
class GeocodeFetcher
  URL = 'https://eu1.locationiq.com/v1/search.php'

  def initialize(query)
    @data = { 'key': ENV['GEO_TOKEN'], 'q': query, format: 'json' }
    @response = Rails.cache.fetch("response", expires_in: 30.minutes) do
      Faraday.get(URL, @data)
    end
    Rails.logger.info "Cached response".yellow
  end

  def response
    Rails.cache.fetch(@response, expires_in: 30.minutes) do
      @response
    end
  end
end
