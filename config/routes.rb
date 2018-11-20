Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  get '/:user_id/logout' => 'users#logout'
  get '/:user_id/mypage' => 'users#mypage'
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :orders,  only: [:new, :create]
  resources :users, only: [:new] do
    resources :profiles, only: [:new, :create, :edit, :update]
    resources :userconfirms, only: [:new, :create]
    resources :addresses, only: [:new, :create, :edit, :update]
  end
end
