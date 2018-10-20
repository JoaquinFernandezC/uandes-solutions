Rails.application.routes.draw do
  resources :causes
  resources :derivations
  resources :projects
  resources :goals
  resources :case_coordinations
  resources :iics
  resources :interinstitutional_coordinations
  resources :error_logs
  resources :logs
  resources :tasks
  resources :documents
  # devise_for :users

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'application#index'
  resources :employees
end
