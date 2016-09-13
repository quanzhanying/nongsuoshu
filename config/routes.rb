Rails.application.routes.draw do
  resources :categories
  resources :books
  devise_for :users

  namespace :admin do
    resources :books
  end
  root to: "books#index"
end
