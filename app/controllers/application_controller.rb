class ApplicationController < ActionController::Base
  protect_from_forgery

  # https://github.com/plataformatec/devise
  # before_filter :authenticate_user!
  # user_signed_in?
  # current_user
end
