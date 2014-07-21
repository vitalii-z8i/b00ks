Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  get 'register' => 'users#new', as: 'register'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :destroy]
  resources :users, only: :create

  root to: 'books#index'

  resources :books do
    resources :chapters, except: :index
  end

  get 'search' => 'searches#search'
end
