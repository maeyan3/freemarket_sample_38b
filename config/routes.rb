Rails.application.routes.draw do
  devise_for :user_details
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  get 'users/new', to: 'users#new'
  get '/logout' => 'users#logout'
  get '/mypage' => 'users#mypage'

  resources :addresses, only: [:new, :create, :edit, :update] do
    resources :userconfirms, only: [:new, :create]
  end
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :orders,  only: [:new, :create]
end
