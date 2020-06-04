Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :new, :delete]
  
  resources :products do
    resources :orders, only: [:new, :create]
  end
end
