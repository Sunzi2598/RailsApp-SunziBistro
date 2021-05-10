Rails.application.routes.draw do
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'

  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  
  resources :products
  resources :users
end
