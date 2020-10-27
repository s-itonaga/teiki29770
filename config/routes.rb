Rails.application.routes.draw do
  devise_for :users
  get 'customers/index'
  root to: "customers#index"
end
