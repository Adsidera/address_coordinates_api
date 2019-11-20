require 'rails_helper'
require 'jwt'

RSpec.describe JsonWebToken do
  let(:payload) { { email: "test@user.de", password: "password"} }
  let(:token) { JsonWebToken.encode(payload) }

  it 'encodes an email and a password' do
    expect(token.class).to eq String
    expect(token.encode(payload).size).to eq  149
  end

  it 'decodes a payload into an hash' do
    expect(JsonWebToken.decode(token).class).to eq ActiveSupport::HashWithIndifferentAccess
  end
end