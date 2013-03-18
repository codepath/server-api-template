module Endpoints
  class Users < Grape::API
    format :json

    before do
      @user = User.find_for_authentication(:email => params[:email]) if params[:email].present?
    end

    resource :users do
      # POST /api/users?email=<n>&password=<n>
      # Returns 201 or 400
      desc "Register a new user"
      params do
        requires :email, type: String, desc: "email for user"
        requires :password, type: String, desc: "password for user"
      end
      post do
        @user = User.new(params.slice(:email, :password))
        if @user.save
          status 201
          @user.as_json
        else # user didn't save
          error!({ :error => "user could not be registered", :details => @user.errors }, 400)
        end
      end
    end # users
  end # Users
end
