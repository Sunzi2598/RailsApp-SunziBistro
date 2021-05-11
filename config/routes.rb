Rails.application.routes.draw do
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'

  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :products do
    post :add_to_cart, on: :member
    delete :remove_from_cart, on: :member
  end
  
  resources :products
  resources :users
end
