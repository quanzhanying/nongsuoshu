Rails.application.routes.draw do
  resources :categories
  resources :books

  resources :plans

  resources :orders

  devise_for :users

  namespace :admin do
    resources :books
    resources :faqs
    resources :plans
    resources :users
    resources :categories
  end

  namespace :account do
    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
      end
    end
  end

  root to: "books#index"
end
