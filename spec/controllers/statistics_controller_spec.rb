require 'rails_helper'

RSpec.describe StatisticsController, type: :controller do
  context 'Getting statistics' do
    let(:user) { create(:user) }
    let(:short_url_params) { {
      link: 'http://localhost:3000/',
      short_link: 'test-link'
    } }
    let!(:short_url) { create(:short_url, short_url_params.merge(user: user)) }
    let(:redirection) { create(:redirection, short_url: short_url, user_info: { ip: :localhost }) }

    it 'downloading short_urls CSV' do
      sign_in(user)
      get :index, format: :csv
      expect(response.body).to include(short_url.short_link)
    end

    it 'downloading redirections CSV' do
      sign_in(user) && redirection
      get :show, params: { id: short_url.short_link }, format: :csv
      expect(response.body).to include('localhost')
    end
  end
end
