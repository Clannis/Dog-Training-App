Rails.application.routes.draw do
  resources :training_session_dogs
  resources :tricks
  resources :trainers
  resources :training_sessions
  resources :courses
  resources :dogs
  resources :users
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  root 'welcome#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
