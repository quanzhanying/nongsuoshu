Rails.application.routes.draw do
  devise_for :users

  resources :categories

  resources :plans

  resources :orders

  resources :books do
    collection do
      get :search
    end
  end

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
