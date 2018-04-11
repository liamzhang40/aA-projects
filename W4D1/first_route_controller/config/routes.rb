Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  # get '/users/:id', to: 'users#show', as: 'awesome_user'
  # get '/users', to: 'users#index'
  # post '/users', to: 'user#create' as: 'create_user'
  resources :artworks, only: [:create, :destroy, :show, :update]


  resources :artwork_shares, only: [:create, :destroy, :index]

  resources :comments
end
