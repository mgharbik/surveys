class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	def can_administer?
    	# current_user.user_type == "admin"
    	current_user.try(:user_type) == "admin" && current_user.try(:email) == "admin@encuestas.com"
    end
end
