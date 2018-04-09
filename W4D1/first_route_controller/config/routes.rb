Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]
  # get '/users/:id', to: 'users#show', as: 'awesome_user'
  # get '/users', to: 'users#index'
  # post '/users', to: 'user#create' as: 'create_user'
  resources :artworks, only: [:create, :destroy, :index, :show, :update]
end
