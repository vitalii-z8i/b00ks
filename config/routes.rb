Rails.application.routes.draw do
  root to: 'books#index'

  resources :books do
    resources :chapters, except: :index
  end

  get 'search' => 'searches#search'
end
