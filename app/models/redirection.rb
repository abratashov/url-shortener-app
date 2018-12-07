class Redirection < ApplicationRecord
  # include RedirectionRestrictions

  belongs_to :short_url, counter_cache: true
end
