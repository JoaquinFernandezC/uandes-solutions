Rails.application.routes.draw do
  resources :iics
  resources :interinstitutional_coordinations
  resources :error_logs
  resources :logs
  resources :tasks
  resources :documents
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'application#index'
end
