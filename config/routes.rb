Rails.application.routes.draw do
  resources :training_session_dogs, only: [:destroy]
  resources :tricks, only: [:show, :edit, :update, :index, :new]
  resources :trick_courses, only: [:destroy]
  resources :trainers, only: [:show, :index, :create, :edit, :update]
  resources :training_sessions, only: [:show, :edit, :update, :destroy]
  resources :courses, only: [:new, :create, :show, :index, :edit, :update] do
    resources :training_sessions, only: [:new, :create, :index]
    resources :tricks, only: [:new, :create, :index, :show]
  end
  resources :dogs, only: [:edit, :show, :update] do
    resources :training_sessions, only: [:show]
  end
  resources :users, only: [:show, :index, :create, :edit, :update] do
    resources :dogs, only: [:new, :create, :show, :index, :destroy]
  end


  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup_user', to: 'users#new', as: :new_user
  get '/signup_trainer', to: 'trainers#new', as: :new_trainer
  post '/signup_user', to: 'users#create'
  post '/signup_trainer', to: 'trainers#create'
  get '/courses/:course_id/tricks/:trick_id/add', to: 'courses#add_trick', as: :add_course_trick
  get '/training_sessions/:id/add_dog', to: 'training_sessions#select_dog', as: :training_session_add_dog
  post '/training_sessions/:id/add_dog', to: 'training_sessions#add_dog'
  post '/tricks/:trick_id', to: 'tricks#add_to_course'
  root 'welcome#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
