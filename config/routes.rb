Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :pets, only: [:index, :new, :create,:show]

  resources :users do
  	resources :pets
  end

  resources :battles

  get "/sessions/new", to: "sessions#new"
  delete "/sessions", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  root to: "sessions#new"

  put "/pets/:id/votes", to: "pets#vote"
end
