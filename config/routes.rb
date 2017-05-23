Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount ImageUploader::UploadEndpoint, at: '/files/upload'
  mount VideoUploader::UploadEndpoint, at: '/files/upload'
  mount AudioUploader::UploadEndpoint, at: '/files/upload'
  mount SubtitleUploader::UploadEndpoint, at: '/files/upload'
  mount DocumentUploader::UploadEndpoint, at: '/files/upload'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'categories#index'
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
    resources :documents
  end
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  get 'videos', to: 'videos#index', concerns: :paginatable
end
