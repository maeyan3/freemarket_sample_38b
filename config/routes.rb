Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get  'items/search_brand' => 'items#search_brand'
  resources :items, only: [:index, :new, :create, :show]
  get 'users/new', to: 'users#new'
  get '/logout' => 'users#logout'
  get '/mypage' => 'users#mypage'
  resources :userconfirms, only: [:new, :create]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :orders,  only: [:new, :create]
end
