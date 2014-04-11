Myflix::Application.routes.draw do
  root to: 'pages#front'
  get 'home', to: "videos#index"
  get 'ui(/:action)', controller: 'ui'

  resources :videos, only: [:show, :index] do
    collection do
      get :search, to: "videos#search"
    end
    resources :reviews, only: [:create]
  end

  resources :queue_items, only: [:create]
  get 'my_queue', to: 'queue_items#index'

  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :users, only: [:create]
  resources :sessions, only: [:create]

  resources :categories, except: [:destroy]
end
