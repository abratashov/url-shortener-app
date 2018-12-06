module ShortLinkGenerator
  extend ActiveSupport::Concern

  included do
    before_validation :generate_short_link
  end

  private

    def generate_short_link
      self.short_link = short_link.blank? ? SecureRandom.urlsafe_base64(5) : short_link
    end
end
