module Endpoints
  class Sessions < Grape::API
    format :json

    before do
      @user = User.find_for_authentication(:email => params[:email]) if params[:email].present?
    end

    resource :sessions do
      # GET /api/sessions
      get do
        "This is a sign that the API endpoints are configured"
      end

      # POST /api/sessions/authenticate?email=<s>&password=<s>
      # Returns 201, 400
      desc "Authenticates a user given email and password"
      params do
        requires :email, type: String, desc: "user's email"
        requires :password, type: String, desc: "user's password"
      end
      post :authenticate do
        if @user && @user.valid_password?(params[:password])
          @user.update_attributes(:last_sign_in_at => Time.now)
          status 201
          @user.as_json
        elsif @user.nil?
          error_not_found!(User)
        else # invalid password
          error!({ "error" => "invalid password" }, 401)
        end
      end

    end # sessions

  end # Sessions
end # Routes