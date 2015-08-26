Rails.application.routes.draw do
  root 'projects#index'

  resources :projects, except: [:show] do
    resources :tasks
  end
end