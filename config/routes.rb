Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :users, only: [:new,:create]
  resources :furimas, only: [:index]
  resources :items, except: [:index] do  
    resources :comments, only: :create
    resources :transactions, only: [:index,:create]
  end
end
