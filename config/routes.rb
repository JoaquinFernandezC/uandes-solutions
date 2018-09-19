Rails.application.routes.draw do
  resources :error_logs
  resources :logs
  resources :tasks
  resources :documents
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'application#index'
end
