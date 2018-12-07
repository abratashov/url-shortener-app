require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  context 'Short url actions' do
    let(:user) { create(:user) }
    let(:short_url_params) { {
      link: 'http://localhost:3000/',
      short_link: 'test-link'
    } }
    let(:short_url) { create(:short_url, short_url_params) }
    let(:params) { {
      short_url: short_url_params
    } }

    before { sign_in(user) }

    it 'successful creation' do
      allow(ShortUrl::CreateService).to receive(:call) {
        double(:service, result: short_url, success?: true, errors: [])
      }
      post :create, params: params
      expect(subject).to redirect_to(short_url_url(short_url))
    end

    it 'failure creation' do
      allow(ShortUrl::CreateService).to receive(:call) {
        double(:service, result: nil, success?: false, errors: [])
      }
      post :create, params: params
      expect(response.status).to eq(200)
    end

    it 'new' do
      get :new
      expect(response.status).to eq(200)
    end

    it 'show' do
      get :show, params: { id: short_url.id }
      expect(response.status).to eq(200)
    end
  end
end
