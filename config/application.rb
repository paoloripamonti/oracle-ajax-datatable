require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OracleAjaxDatatble
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
    end 
  end
end
