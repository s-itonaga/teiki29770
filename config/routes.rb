Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  get 'search', to: 'stocks#search'
  resources :users, only: %i[index edit update]
  resources :customers do
    resources :products do
      collection { post :csv_import }
    end
  end
  resources :calendars do
    resources :stocks do
      collection { post :csv_import }
    end
  end
end
