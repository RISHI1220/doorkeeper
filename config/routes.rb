# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  devise_for :users
  # Defines the root path route ("/")
  resources :books
  root 'books#index'

  # Api routes
  namespace :api do
    namespace :v1 do
      # resources :apis
      # show all
      get 'books', to: 'apis#index'

      # Show perticular using query or body parameter
      get 'show', to: 'apis#show'
      # Show perticular using url parameter
      get 'show/:id', to: 'apis#show'

      # Create new record and pass parameters in body or query parameter
      post 'create', to: 'apis#create'

      # Update record using url id parameter and attrabute parameter in body or query
      put 'update/:id', to: 'apis#update'
      patch 'update/:id', to: 'apis#update'
      # Update record using id from query parameter or attrabutes parameters in body
      put 'update', to: 'apis#update'
      patch 'update', to: 'apis#update'

      # Delete record using if from url parameter
      delete 'delete/:id', to: 'apis#destroy'
      # Delete record using query or body paramter
      delete 'delete', to: 'apis#destroy'

      resources :users, only: %i[create]
    end
  end
end
