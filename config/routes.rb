Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount ImageUploader::UploadEndpoint, at: '/attachments/images'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'categories#index'
  resources :categories do
    resources :posts do
      member do
        get 'language/:language', action: 'language', as: 'language'
      end
    end
  end
  resources :documents
end
