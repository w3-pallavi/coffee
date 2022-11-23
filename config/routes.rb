Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
  resources :items
  resources :order_items
  resources :carts
  resources :orders
  devise_for :users, :controllers => {:registrations => "users/registrations"}

end
