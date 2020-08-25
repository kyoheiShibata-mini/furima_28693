Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :users, only: [:new,:create]
  resources :furimas, only: [:index]
  resources :items, expect: [:index]
end
