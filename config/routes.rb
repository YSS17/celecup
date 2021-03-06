Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :carts, only: [:create]
  end

  resources :carts, only: [:show]

  get "/show", to: "pages#show"
  get "/orders", to: "pages#orders"


end
