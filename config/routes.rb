Encuestas::Application.routes.draw do

  resources :roles
  devise_for :users

  mount Rapidfire::Engine => "/rapidfire"
  root to: "rapidfire/question_groups#index"

end
