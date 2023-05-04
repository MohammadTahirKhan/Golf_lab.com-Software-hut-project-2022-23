Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
    patch 'users/edit' => "devise/registrations#edit"
  end

  post '/data/deleter', to: 'data#deleter'
  post '/data/:id/edit', to: 'data#create'
  get '/data/:id/edit/userhole', to: 'data#edit', as: :userhole_editing
  post '/data/:id/edit/userhole', to: 'data#create'
  post '/data/new' , to: 'data#create'
  post '/data', to: redirect('/holes')
  
  resources :data
  resources :user_holes
  resources :holes
  resources :courses
  resources :admin

  get '/export', to: 'export#index'
  post '/holes/new' , to: 'holes#create'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
