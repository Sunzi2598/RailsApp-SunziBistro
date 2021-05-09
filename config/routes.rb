Rails.application.routes.draw do
  get 'users/new'
  get 'carts/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  get '/dashboard', to: 'dashboard#index'
  
  resources :products
end
