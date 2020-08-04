Rails.application.routes.draw do
  resources :training_session_dogs
  resources :tricks
  resources :trainers
  resources :training_sessions
  resources :courses
  resources :dogs
  resources :users
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup_user', to: 'users#new', as: "user_signup"
  get '/signup_trainer', to: 'trainerss#new', as: "trainer_signup"
  post '/signup_user', to: 'users#create'
  post '/signup_trainer', to: 'trainers#create'
  root 'welcome#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
