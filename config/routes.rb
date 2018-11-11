Rails.application.routes.draw do
  root 'products#index'
  resources :items, only: [:index, :new, :create]
end
