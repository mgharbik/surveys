Encuestas::Application.routes.draw do
	get "pages/about"
  	match "about", to: "pages#about", via: [:get]

	controller :authentications do
	    get 'login' => :new
	    post 'login' => :create
	    delete 'logout' => :destroy
  	end

  	resources :roles
  	devise_for :users

  	mount Rapidfire::Engine => "/rapidfire"
  	root to: "rapidfire/question_groups#index"

end
