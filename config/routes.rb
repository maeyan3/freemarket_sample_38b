Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :items, only: [:index, :new, :create]
  get 'users/new', to: 'users#new'
  get '/logout' => 'users#logout'
  resources :userconfirms, only: [:new, :create]
  resources :addresses, only: [:new, :create]
end
