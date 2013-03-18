module Endpoints
  class Sessions < Grape::API
    before do
      @user = User.find_for_authentication(:email => params[:email]) if params[:email].present?
    end

    resource :users do
      # POST /users?phone=<n>&email=<n>&password=<n>&first_name=<n>&last_name=<n>&dot_id=5677&time_zone=<t>&cycle=<c>
      # Returns 201 or 400
      desc "Register a new user"
      params do
        requires :email, type: String, desc: "email for user"
        requires :password, type: String, desc: "password for user"
        requires :first_name, type: String, desc: "first_name for user"
        requires :last_name, type: String, desc: "last_name for user"
        optional :dot_id, type: String, desc: "dot_id for user"
        optional :time_zone, type: String, desc: "timezone for user"
        optional :cycle, type: String, desc: "cycle for user"
      end
      post do
        @user = User.new(params.except(:route_info, :version, :role))
        @user.role = "driver"
        if @user.save
          status 201
          @user.to_json
        else # user didn't save
          error!({ :error => "user could not be registered", :details => @user.errors }, 400)
        end
      end
    end # users
  end # Users
end
