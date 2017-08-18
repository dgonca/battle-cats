Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :users
=======
  resources :pets, only: [:index, :new, :create]
  resources :users do 
  	resources :pets
  end
  
  resources :sessions

>>>>>>> a666c7dfc71bc4fbea6a72dcd04661f564987b73
  root to: "sessions#new"

end
