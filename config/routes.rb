Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#new"

  ####
  resources :users do 
  	resources :pets
  end

  get '/sessions/new', to: "sessions#new"
  post '/sessions' to: "sessions#create"
  delete '/sessions' to: "sessions#destroy"
end
