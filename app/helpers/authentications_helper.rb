module AuthenticationsHelper
	
	def can_vote?
    	session[:role] && session[:username]
    end

    def can_administer?
    	# current_user.user_type == "admin"
    	current_user.try(:user_type) == "admin" && current_user.try(:email) == "admin@encuestas.com"
    end
end
