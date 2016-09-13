Rails.application.routes.draw do
  resources :categories
  resources :books
  devise_for :users

  root to: "books#index"
end
