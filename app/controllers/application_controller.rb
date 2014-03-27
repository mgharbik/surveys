class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	def authenticate_user?
  		unless current_user.user_signed_in?
        	redirect_to main_app.new_user_session_path, alert: "You don't have authorization to this page. Please login"
        	#raise Rapidfire::AccessDenied.new("cannot administer questions")
      	end
  	end

  	def can_administer?
    	# current_user.user_type == "admin"
    	current_user.try(:user_type) == "admin" && current_user.try(:email) == "admin@encuestas.com"
    end

    def authenticate_administrator!
    	unless can_administer?
        	redirect_to main_app.new_user_session_path, alert: "You don't have authorization to this page. Please login"
        	#raise Rapidfire::AccessDenied.new("cannot administer questions")
      	end
    end

end
