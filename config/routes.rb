Rails.application.routes.draw do
  root to: "furimas#index"
  resources :furimas, only: [:index]
end
