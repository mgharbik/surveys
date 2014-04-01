class AuthenticationsController < ApplicationController
	before_action :no_user_connected!, only: [:new, :create]

  	def new
  	end

  	def create
	  	# 1. mandamos a los servicios email/pass
		# 2. si devuelve ok+role
		uri = URI.parse("http://www.sepla.es/pages/API/index.php?request=login")
		response = Net::HTTP.post_form(uri, {"email" => params[:email], "password" => params[:password]})
		

		unless response.body.nil? || JSON.parse(response.body)["seccion_sindical"].nil?
			data = JSON.parse(response.body)
			# guadamos su rol en session
			session[:role] = data["seccion_sindical"] 
			# guardamos su username en session
			session[:username] = data["email"] 
			#redirect_to rapidfire.question_groups_path, notice: "You're logged in"
			redirect_back_or rapidfire.question_groups_path
			flash[:notice] = "You're logged in"
		else
			# 3. si devuelve false
			redirect_to main_app.login_path, alert: "Invalid user/password combination"
		end
  	end

  	def destroy
  		session[:role] = nil
		session[:username] = nil
		redirect_to main_app.login_path, notice: "You're logged out"
  	end

  	def store_location
	    session[:return_to] = request.url if request.get?
	end

	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
	end


end
