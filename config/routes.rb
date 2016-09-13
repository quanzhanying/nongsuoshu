Rails.application.routes.draw do
  resources :categories
  resources :books
  devise_for :users

  namespace :admin do
    resources :books do
      member do
        post :publish
        post :hide
      end
    end
    resources :faqs
    resources :plans
    resources :users
    resources :categories
  end
  root to: "books#index"
end
