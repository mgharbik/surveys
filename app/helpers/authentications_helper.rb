module AuthenticationsHelper
	require "net/http"
  require "uri"
  #def sign_in(user)
  #  session[:user_id] = user.id
  #end

  #def sign_out
  #  session[:user_id] = nil
  #end

  #def signed_in?
  #  !session[:user_id].nil?
  #end

  #def current_user=(user)
  #  @current_user = user
  #end

  #def current_user
  #  @current_user ||= User.find(session[:user_id])
  #end

  #def current_user?(user)
  #  user == current_user
  #end


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
