Rails.application.routes.draw do
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'


  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/cart', to: 'carts#show'
  post 'order_items/:id', to: 'order_items#create'
  
  resources :order_items do 
    patch :add_quantity, on: :member
    patch :reduce_quantity, on: :member
  end
  
  resources :carts do
    delete :destroy
  end

  resources :orders, only: %i[create index] do 
    patch :deliver_order, on: :member
  end

  resources :users
  resources :products
  resources :account_activations, only: :edit
  resources :password_resets, only: %i[new create edit update]
end
