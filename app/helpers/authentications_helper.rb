module AuthenticationsHelper
	require "net/http"
  require "uri"

	  def can_vote?
    	session[:role] && session[:username]
    end

    def can_administer?
    	# current_user.user_type == "admin"
    	current_user.try(:user_type) == "admin" && current_user.try(:email) == "admin@encuestas.com"
    end

   	def store_location
	    session[:return_to] = request.url if request.get?
	end

	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
	end
	
end
