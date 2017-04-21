Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'categories#index'
  resources :documents
  concern :tagable do
    get '(tag/:tag)', action: :index, on: :collection, as: ''
  end
  resources :pages, concerns: :tagable
  resources :categories do
    resources :posts do
      member do
        get 'language/:language', action: 'language', as: 'language'
      end
    end
  end
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  get 'videos', to: 'videos#index', concerns: :paginatable
end
