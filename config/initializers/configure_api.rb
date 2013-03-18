# TODO set API username and password (for basic_auth)
API_USERNAME = "..."
API_PASSWORD = "..."

require File.dirname(__FILE__) + '/../../lib/smart_params_parser'

# ServerApiTemplate::Application.config.middleware.swap ActionDispatch::ParamsParser,
#  SmartParamsParser, :ignore_prefix => '/api'

# Auto-reload API files
if Rails.env.development?
  lib_reloader = ActiveSupport::FileUpdateChecker.new(Dir["#{Rails.root}/app/api/**/*"]) do
    Rails.application.reload_routes!
  end

  ActionDispatch::Callbacks.to_prepare do
    lib_reloader.execute_if_updated
  end
end