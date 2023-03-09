Rails.application.routes.draw do
  devise_for :users
  resources :data
  resources :user_holes
  resources :holes
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

end
