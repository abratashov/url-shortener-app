require 'rails_helper'

RSpec.describe RedirectionsController, type: :controller do
  context 'Redirection by short url' do
    let(:short_url_params) { {
      link: 'http://localhost:3000/',
      short_link: 'test-link'
    } }
    let(:short_url) { create(:short_url, short_url_params) }

    it 'successful redirection' do
      allow(RedirectionService).to receive(:call) {
        double(:service, result: short_url, success?: true, errors: [])
      }
      get :show, params: { id: short_url.short_link }
      expect(subject).to redirect_to(short_url.link)
    end

    it 'failure redirection' do
      allow(RedirectionService).to receive(:call) {
        double(:service, result: nil, success?: false, errors: [])
      }
      get :show, params: { id: 'absent-link' }
      expect(response.status).to eq(404)
    end
  end
end
