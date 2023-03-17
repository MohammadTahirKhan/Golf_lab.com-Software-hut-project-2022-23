Rails.application.routes.draw do
  devise_for :users

  # get '/holes/:id/edit', to: 'data#index'
  # post '/holes/:id/edit', to: 'data#create'
  get '/holes/:id/edit', to: 'data#index'

  resources :data
  resources :user_holes
  resources :holes
  resources :courses

  post '/holes/:id/edit', to: 'data#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
