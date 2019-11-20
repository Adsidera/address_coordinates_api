require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_attribute :email }
  it { is_expected.to have_attribute :password_digest }
end
