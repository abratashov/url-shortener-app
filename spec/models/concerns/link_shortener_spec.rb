require 'rails_helper'

shared_examples_for LinkShortener do
  context 'methods' do
    subject { described_class }

    it { is_expected.to have_before_validation_callback_on(:generate_short_link) }
  end
end

describe ShortUrl do
  it_behaves_like LinkShortener
end
