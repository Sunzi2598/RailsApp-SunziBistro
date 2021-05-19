Rails.application.routes.draw do
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'

  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :products, only: %i[new create destroy edit update show index] do
    post :add_to_cart, on: :member
    delete :remove_from_cart, on: :member
  end

  resources :users
  resources :account_activations, only: [:edit]
end
