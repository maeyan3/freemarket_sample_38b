Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  get 'users/new', to: 'users#new'
  get '/logout' => 'users#logout'
  resources :userconfirms, only: [:new, :create]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credits, only: [:index, :new, :create, :destroy]
end
