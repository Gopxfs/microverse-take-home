Rails.application.routes.draw do
  resources :users, only: [:index, :show]

  get '/get_users', to: 'users#get_users'
  root to: 'users#index'
end
