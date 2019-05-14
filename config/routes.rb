Rails.application.routes.draw do
  get 'sessions/new'
  root to: "tasks#index"
  get '/search',to: 'tasks#search'
  resources:tasks
  namespace :admin do
    resources :users
  end
  resources :users
  resources:sessions, only:[:new,:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
