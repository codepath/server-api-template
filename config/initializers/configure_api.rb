# TODO set API username and password (for basic_auth)
API_USERNAME = "..."
API_PASSWORD = "..."

# Auto-reload API files
if Rails.env.development?
  lib_reloader = ActiveSupport::FileUpdateChecker.new(Dir["#{Rails.root}/app/api/**/*"]) do
    Rails.application.reload_routes!
  end

  ActionDispatch::Callbacks.to_prepare do
    lib_reloader.execute_if_updated
  end
end