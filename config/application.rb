require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module UrlShortenerApp
  class Application < Rails::Application
    config.load_defaults 5.2

    config.autoload_paths += Dir[
      "#{config.root}/app/services",
      "#{config.root}/lib"
    ]
  end
end
