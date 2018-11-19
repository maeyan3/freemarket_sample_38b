Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  get 'users/new', to: 'users#new'
  get '/logout' => 'users#logout'
end
