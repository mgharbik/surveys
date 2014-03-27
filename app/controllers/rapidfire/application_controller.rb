module Rapidfire
  class ApplicationController < ::ApplicationController
    helper_method :can_administer?

    #def authenticate_administrator!
    #	unless can_administer?
    #    	redirect_to root_path, alert: "You don't have authorization to this page"
        	#raise Rapidfire::AccessDenied.new("cannot administer questions")
    #  	end
    #end

    protected
	def authorize
	    unless user_signed_in?
	    	redirect_to root_path, alert: "You don't have authorization to this page"
	    end
	end

  end
end
