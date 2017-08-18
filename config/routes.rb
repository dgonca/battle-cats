Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :users
=======
  resources :pets, only: [:index, :new, :create]
  # root to: "sessions#new"

  ####
  resources :users do 
  	resources :pets
  end

  resources :sessions
  # get '/sessions/new', to: "sessions#new"
  # post '/sessions' to: "sessions#create"
  # delete '/sessions' to: "sessions#destroy"

>>>>>>> a666c7dfc71bc4fbea6a72dcd04661f564987b73
  root to: "sessions#new"
end
