Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/delete'
  resource :home, controller: :home, only: [:show]
  root to: 'home#show'
  get 'home/show'
  resources :sessions, only: [:create, :new, :destroy ]
  get 'signup' => "users#new"
  post 'signup' => 'users#create'
  post 'sessions/new' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
