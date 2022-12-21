require_relative "boot"

require "rails/all"
require "graphql/client"
require "graphql/client/http"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Animest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.default_locale = :ja
  end

  AUTH_HEADER = "Bearer dCXez122WWdr8vPM9YE0jd1xj24O0wgxGqEO_WJauwI"
  HTTP = GraphQL::Client::HTTP.new("https://api.annict.com/graphql") do
    def headers(context)
      { "Authorization": AUTH_HEADER }
    end
  end
  Schema = GraphQL::Client.load_schema(HTTP)
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end
