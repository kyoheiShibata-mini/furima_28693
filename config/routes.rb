Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :users, only: [:new,:create]
  resources :furimas, only: [:index,:new,:create]
  resources :items, only: [:show]
  #get 'posts/:id', to: 'posts#checked'
end
