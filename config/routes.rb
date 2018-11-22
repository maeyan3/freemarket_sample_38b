Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :orders,  only: [:new, :create]
  resources :users, only: [:new] do
    resources :userconfirms, only: [:new, :create]
    resources :addresses, only: [:new, :create, :edit, :update]
    get 'logout' => 'users#logout'
    get 'mypage' => 'users#mypage'
    get 'profile' => 'profiles#edit'
    patch 'profile' => 'profiles#update'
  end
end
