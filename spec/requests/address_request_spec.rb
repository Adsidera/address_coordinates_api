require 'rails_helper'

RSpec.describe 'Address Request', type: :request do

  context 'without authentication' do
    it 'returns 401 unauthorized' do
      get '/api/v1/'
      expect(response.status).to eq 401
    end
  end

  context 'with authentication' do
    let(:user) { Fabricate(:user) }
    let(:auth_token) { token(user) }
    let(:auth_headers) { { "AUTHORIZATION" => "Bearer #{auth_token}" } }

    it 'returns a message with no address params' do
      get '/api/v1', headers: auth_headers
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(response.body).to include "Address missing in request"
    end

    it 'returns latitude and longitude with address param' do
      get '/api/v1', headers: auth_headers, params: { address: "Palazzo Reale, Naples, Italy" }
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(response.body).to include "lat"
      expect(parsed_response["lat"]).to match "40.8363693"
      expect(response.body).to include "lon"
      expect(parsed_response["lon"]).to match "14.2505774249405"
      expect(response.body).to include "display_name"
      expect(parsed_response["display_name"]).to match "Palazzo Reale, Piazza Trieste e Trento, Municipalità 1, Naples, NA, Campania, Italy"
    end
  end
end
