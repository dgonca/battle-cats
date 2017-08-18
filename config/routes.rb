Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pets, only: [:index, :new, :create]
  resources :users do 
  	resources :pets
  end
  
  get "/sessions/new", to: "sessions#new"
  delete "/sessions", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  root to: "sessions#new"
end
