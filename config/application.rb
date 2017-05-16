require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pwcbot2
  class Application < Rails::Application
    config.time_zone = 'America/La_Paz'
    config.active_record.default_timezone =  'America/La_Paz'
  end
end
