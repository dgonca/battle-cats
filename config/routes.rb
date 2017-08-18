Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, only: [:index, :new, :create]
  resources :users do 
  	resources :pets
  end
  
  resources :sessions

  root to: "sessions#new"

end
