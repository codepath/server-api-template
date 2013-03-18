require "grape"
# require "rabl"
# require "grape/rabl"

# Rabl.configure do |c|
#   c.view_paths = [Rails.root.join("app/views")]
# end

# Routes defined in routes folder
class ApiRouter < ApiBase
  #
  # TODO For basic auth (to protect API)
  #
  # http_basic do |username, password|
  #  username == API_USERNAME && password == API_PASSWORD
  # end

  version 'v1', :using => :path, :cascade => false
  format :json
  # formatter :json, Grape::Formatter::Rabl
  load_routes :sessions, :users # Load routes from endpoints folder

  # Exception handling
  rescue_from :all do |e|
    if e.kind_of?(Grape::Exceptions::Base) # validation error
      rack_response({ error: e.message }.to_json, e.status)
    else # unexpected error
      # Log the error
      Rails.logger.error "Exception Message: #{e.message}\nBacktrace:\n#{e.backtrace.first(5).join("\n")}"
      # Notify external service of the error
      Airbrake.notify(e)
      # Send error and backtrace down to the client in the response body (only for internal/testing purposes of course)
      rack_response({ message: e.message, backtrace: e.backtrace.first(5).join("\n") }, 500)
    end
  end

  helpers do
    # Requires a user or raises a 404
    def require_user!
      unless current_user
        error!({ "error" => "user not specified" }, 401)
      end
    end

    # Responds with success message and specified status
    # respond_result_success!(201)
    def respond_result_success!(code=200)
      status code
      { :result => true }
    end

    # Return a 404 for cases where resource could not be found
    # error_not_found!(User)
    def error_not_found!(resource)
      error!({ "error" => "#{resource.to_s.underscore} not found" }, 404)
    end

    # Returns the current_user based on auth user header
    def current_user
      @current_user ||= User.find(Integer(env['HTTP_X_USER_AUTH'])) if env['HTTP_X_USER_AUTH'].present?
    end
  end
end