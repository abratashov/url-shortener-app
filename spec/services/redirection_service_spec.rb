require 'rails_helper'

RSpec.describe RedirectionService, type: :class do
  context 'Creation the  short link' do
    let(:link) { 'short_link' }
    let(:short_url) { create(:short_url,
      link: 'http://localhost:3000/',
      short_link: link
    ) }
    let(:request) { double(:request, remote_ip: :locahost)}

    it 'with success' do
      service = nil
      expect {
        service = RedirectionService.call({ short_link: short_url.short_link }, request)
      }.to change(Redirection, :count).by(1)
      expect(service.success?).to be_truthy
    end

    it 'with failure' do
      service = nil
      expect {
        service = RedirectionService.call({ short_link: 'absent-link' }, request)
      }.to change(Redirection, :count).by(0)
      expect(service.success?).to be_falsey
      expect(service.errors).to include(/url must exist/)
    end
  end
end
