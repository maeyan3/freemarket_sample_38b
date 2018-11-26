Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:      'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  get  'items/search_brand' => 'items#search_brand'
  resources :items, only: [:index, :new, :create, :show] do
    resources :orders,  only: [:new, :create]
  end
  resources :credits, only: [:index, :new, :create, :destroy]

  post 'orders/pay' => 'orders#pay'
  get 'orders/pay' => 'orders#pay'
  resources :users, only: [:new] do
    resources :userconfirms, only: [:new, :create]
    resources :addresses, only: [:new, :create, :edit, :update]
    get 'mypage' => 'users#mypage'
    get 'profile' => 'profiles#edit'
    patch 'profile' => 'profiles#update'
  end
  get 'logout' => 'users#logout' # ログアウトボタンがある画面への遷移
end
