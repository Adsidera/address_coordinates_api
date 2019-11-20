require 'rails_helper'

RSpec.describe GeocodeFetcher do
  before do
    @fetcher = GeocodeFetcher.new("Bundestag, Berlin, Germany")
  end

  it 'initializes a faraday response' do
    expect(@fetcher.response.class).to eq Faraday::Response
  end
end