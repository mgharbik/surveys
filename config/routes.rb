Encuestas::Application.routes.draw do
	get "pages/about"
  	match "about", to: "pages#about", via: [:get]

	controller :authentications do
	    get 'login' => :new
	    post 'login' => :create
	    delete 'logout' => :destroy
  	end

  	resources :roles
    devise_for :users, controllers: {registrations: 'registrations'}

  	mount Rapidfire::Engine => "/panel"
  	root to: "rapidfire/question_groups#index"

end
