Rails.application.routes.draw do
  resources :tricks
  resources :trainers
  resources :training_sessions
  resources :courses
  resources :dogs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
