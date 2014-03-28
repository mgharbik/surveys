class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    def can_vote?
      session[:role] && session[:username]
    end

    def can_administer?
      # current_user.user_type == "admin"
      current_user.try(:user_type) == "admin" && current_user.try(:email) == "admin@encuestas.com"
    end

  	def authenticate_user?
  		unless can_vote?
        	redirect_to main_app.root_path, alert: "You don't have authorization to this page. Please login"
      end
  	end

    def authenticate_administrator!
    	unless can_administer?
        	redirect_to main_app.root_path, alert: "You don't have authorization to this page. Please login"
        	#raise Rapidfire::AccessDenied.new("cannot administer questions")
      	end
    end


    def authorize_only_voter!
        unless can_vote?
            redirect_to main_app.root_path, alert: "You don't have authorization to this page. Please login"
        end   
    end

    def authorize_only_administrator!
        unless can_administer?
            redirect_to main_app.root_path, alert: "You don't have authorization to this page. Please login"
            #raise Rapidfire::AccessDenied.new("cannot administer questions")
        end
    end

    def authorize_both_admin_and_voter!
        unless can_administer? || can_vote?
            redirect_to main_app.root_path, alert: "You don't have authorization to this page. Please login"
            #raise Rapidfire::AccessDenied.new("cannot administer questions")
        end
    end

end
