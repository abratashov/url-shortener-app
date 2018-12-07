require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  context 'associations' do
    before { build(:short_url) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:redirections) }
  end

  context 'methods' do
    subject { build(:short_url) }
    let(:link) { build(:short_url, short_link: 'test-link') }

    it { expect(subject.full_short_link).to include(subject.short_link) }
    it { expect(link.full_short_link).to include('test-link') }
  end
end
