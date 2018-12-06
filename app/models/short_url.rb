class ShortUrl < ApplicationRecord
  include ShortLinkGenerator

  validates :link, presence: true, url: true
  validates :short_link, presence: true, uniqueness: true

  belongs_to :user
end
