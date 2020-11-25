Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: %i[index edit update]
  resources :customers do
    resources :products
  end
  resources :calendars do
    resources :stocks do
      collection { post :import }
    end
  end
end
