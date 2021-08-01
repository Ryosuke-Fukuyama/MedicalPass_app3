require_relative 'boot'

require 'rails'
## Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
## require "rails/test_unit/railtie"

## Require the gems listed in Gemfile, including any gems
## you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MPass3
  class Application < Rails::Application
    ## Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.exceptions_app = ->(env) { ErrorsController.action(:show).call(env) }

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework :rspec,
                       model_specs: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
    end
  end
end
