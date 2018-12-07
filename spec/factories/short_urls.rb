FactoryBot.define do
  factory :short_url do
    link { FFaker::Internet.uri('http') }
    short_link { SecureRandom.urlsafe_base64(5) }
    user
  end
end
