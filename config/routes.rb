Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'categories#index'
  resources :categories
end
