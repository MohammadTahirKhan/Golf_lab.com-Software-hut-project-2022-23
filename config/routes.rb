Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
    patch 'users/edit' => "devise/registrations#edit"
  end

  # get '/holes/:id/edit', to: 'data#index'
  # post '/holes/:id/edit', to: 'data#create'
  # get '/holes/:id/edit', to: 'data#index'

  resources :data
  resources :user_holes
  resources :holes
  resources :courses

  get '/export', to: 'export#index'
  post '/holes/new' , to: 'holes#create'
  get '/draw' , to: 'holes#drawholes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
