# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tutorials, only: %i[show index]
      resources :videos, only: [:show]
    end
  end

  root 'welcome#index'
  get 'tags/:tag', to: 'welcome#index', as: :tag
  get '/register', to: 'users#new'
  get '/activation', to: 'activation#index'
  get '/about', to: 'about#show'
  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :tutorials, only: %i[create edit update destroy new] do
      resources :videos, only: [:create]
    end
    resources :videos, only: %i[edit update]

    namespace :api do
      namespace :v1 do
        put 'tutorial_sequencer/:tutorial_id', to: 'tutorial_sequencer#update'
      end
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'github/sessions#update'
  resources :users, only: %i[new create update ]
  get 'users/:id', to: 'users#update'
  resources :tutorials, only: %i[show] 

  resources :user_videos, only: %i[create]
  get '/invite', to: 'invitations#new'
  post '/email_invite', to: 'invitations#create'
end
