require_relative 'boot'

require 'rails/all'

# config.action_controller.asset_host = "http://assets%d.artstore.com"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eatgether
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
		# config.i18n.default_locale = :sv #this line would use the default devise language (EN)
		config.i18n.default_locale = :'zh-CN'
  end
end
