Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'home#index'
  root 'splash#index'
  resources :categories do
    resources :transactions, only: [:show]
  end
end