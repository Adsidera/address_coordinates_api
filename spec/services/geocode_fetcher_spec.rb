require 'rails_helper'

RSpec.describe GeocodeFetcher do
  before do
    @fetcher = GeocodeFetcher.new("Bundestag, Berlin, Germany")
  end
  it 'initializes a faraday response' do

    expect(@fetcher.response.class).to eq Faraday::Response
  end

  it 'has a response with geocode data' do
    expect(JSON.parse(@fetcher.response.body).first).to include "lat"
    expect(JSON.parse(@fetcher.response.body).first).to include "lon"
    expect(JSON.parse(@fetcher.response.body).first).to include "display_name"
  end
end