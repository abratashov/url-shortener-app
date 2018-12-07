require 'rails_helper'

RSpec.describe Redirection, type: :model do
  context 'associations' do
    before { build(:redirection) }

    it { is_expected.to belong_to(:short_url) }
    it { is_expected.to belong_to(:short_url).counter_cache(true) }
  end
end
