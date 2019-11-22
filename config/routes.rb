Rails.application.routes.draw do
  resources :posts, only: [:create, :new, :index ]
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/delete'

  root to: 'posts#index'
  
  resources :sessions, only: [:create, :new, :destroy ]
  post 'posts/new' => 'posts#create'
  get 'signup' => "users#new"
  post 'signup' => 'users#create'
  post 'sessions/new' => 'sessions#create'
  post 'sessions/create' => 'sessions#create'
  get 'signout' => 'sessions#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
