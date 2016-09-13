Rails.application.routes.draw do
  resources :categories
  resources :books
  devise_for :users

  namespace :admin do
    resources :books
    resources :faqs
    resources :plans
    resources :users do
      member do
      post :promote
      post :demote
      end
    end
    resources :categories
  end
  root to: "books#index"
end
