Rails.application.routes.draw do
  resources :categories
  resources :books do
    collection do
      get :search
    end
  end
  devise_for :users

  namespace :admin do
    resources :books
    resources :faqs
    resources :plans
    resources :users
    resources :categories
  end
  root to: "books#index"
end
