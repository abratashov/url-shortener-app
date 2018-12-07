require 'rails_helper'

RSpec.describe ShortUrl::CreateService, type: :class do
  context 'Creation the  short link' do
    let(:user) { build(:user) }
    let(:params) { {
      link: 'http://localhost:3000/',
      short_link: 'test-link'
    } }

    it 'with success' do
      service = nil
      expect {
        service = ShortUrl::CreateService.call(user, params)
      }.to change(ShortUrl, :count).by(1)
      expect(service.success?).to be_truthy
    end

    it 'with failure' do
      ShortUrl::CreateService.call(user, params)
      service = ShortUrl::CreateService.call(user, params)
      expect(service.success?).to be_falsey
      expect(service.errors).to include(/has already been taken/)
    end

    it 'with wrong link for this domain' do
      service = ShortUrl::CreateService.call(user, {
        link: ENV['APP_DEFAULT_URL_OPTIONS_HOST'],
        short_link: 'test-link'
      })
      expect(service.success?).to be_falsey
      expect(service.errors).to include(/isn't supported/)
    end
  end
end
