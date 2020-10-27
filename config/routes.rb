Rails.application.routes.draw do
  get 'customers/index'
  root to: "customer#index"
end
