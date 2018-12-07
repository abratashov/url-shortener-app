require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    before { build(:user) }

    it { is_expected.to have_many(:short_urls) }
  end

  context 'authentication' do
    let(:user) { build(:user,
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123')
    }
    it { expect(user.valid_password?('password123')).to be_truthy }
  end
end
