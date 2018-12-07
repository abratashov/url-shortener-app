module LinkShortener
  extend ActiveSupport::Concern

  included do
    before_validation :generate_short_link
    validate :link_acceptance
  end

  private

    def generate_short_link
      self.short_link = short_link.blank? ? SecureRandom.urlsafe_base64(5) : short_link
    end

    def link_acceptance
      if link.strip.match(ENV['APP_DEFAULT_URL_OPTIONS_HOST'])
        errors.add(:link, "isn't supported for this domain")
      end
    end
end
