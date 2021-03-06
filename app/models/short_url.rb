class ShortUrl < ApplicationRecord
  include LinkShortener

  validates :link, presence: true, url: true
  validates :short_link, presence: true, uniqueness: true

  belongs_to :user
  has_many :redirections

  def full_short_link
    # move it to decorator in future
    "#{ENV['APP_DEFAULT_URL_OPTIONS_HOST']}/#{short_link}"
  end
end
