class RegistrationsController < Devise::RegistrationsController
	before_action :access_denied
	
	def new
		super
	end

 	def create
 		super		
 	end
 
end