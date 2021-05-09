Rails.application.routes.draw do
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'
  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :products
  resources :users
end
