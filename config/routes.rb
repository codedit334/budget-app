Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'splash#index', as: :unauthenticated_root
  end
  # root 'splash#index'
  resources :categories do
    resources :its_transactions
  end
end
# resources :transactions, only: [:show]
