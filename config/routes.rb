Rails.application.routes.draw do
  resources :training_session_dogs, only: [:destroy]
  resources :tricks, only: [:show, :edit, :update]
  resources :trick_courses, only: [:destroy]
  resources :trainers, only: [:show, :create, :edit, :update]
  resources :training_sessions, only: [:show, :edit, :update, :destroy]
  resources :courses, only: [:new, :create, :show, :index, :edit, :update] do
    resources :training_sessions, only: [:new, :create, :index]
    resources :tricks, only: [:new, :create, :index]
  end
  resources :dogs, only: [:new, :create, :edit, :show, :update] do
    resources :courses, only: [:index, :show]
    resources :training_sessions, only: [:show]
  end
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
  # get '/training_session/:id/dogs/:dog_id/add', to: 'training_sessions#add_dog', as: :add_training_session_dog
  get '/users/:user_id/training_sessions/:id/add', to: 'training_sessions#user_add_dog', as: :add_user_training_session
  post '/users/:user_id/training_sessions/:training_session_id/add', to: 'training_sessions#add_dog_training_session'
  get '/courses/:course_id/tricks/:trick_id/add', to: 'courses#add_trick', as: :add_course_trick
  get '/training_sessions/:id/add_dog', to: 'training_sessions#select_dog', as: :training_session_add_dog
  post '/training_sessions/:id/add_dog', to: 'training_sessions#add_dog'
  root 'welcome#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
