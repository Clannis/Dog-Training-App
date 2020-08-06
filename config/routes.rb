Rails.application.routes.draw do
  resources :training_session_dogs, only: []
  resources :tricks, only: []
  resources :trainers, only: [:show, :create]
  resources :training_sessions, only: [:show, :edit, :update]
  resources :courses, only: [:new, :create, :show]
  resources :dogs, only: [:edit, :show, :update]
  resources :users, only: [:show, :index, :create] do
    resources :dogs, only: [:new, :create, :show, :index, :destroy]
  end


  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup_user', to: 'users#new', as: :new_user
  get '/signup_trainer', to: 'trainers#new', as: :new_trainer
  post '/signup_user', to: 'users#create'
  post '/signup_trainer', to: 'trainers#create'
  root 'welcome#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
