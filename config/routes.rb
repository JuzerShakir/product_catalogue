Rails.application.routes.draw do
  root to: "products#new"
  devise_for :users
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end