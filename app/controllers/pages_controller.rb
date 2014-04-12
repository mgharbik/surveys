class PagesController < ApplicationController

	def about
		uri = URI.parse("http://www.sepla.es/pages/API/index.php?request=login")
		@response = Net::HTTP.post_form(uri, {"email" => "gpenya@sdal.es", "password" => "hSWVqbF2qT"})
		
		@data = JSON.parse(@response.body)


		# Full control
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Post.new(uri.request_uri)
		request.set_form_data({"email" => "gpenya@sdal.es", "password" => "hSWVqbF2qT"})
		@response = http.request(request)

		@data = JSON.parse(@response.body)
	end
end
