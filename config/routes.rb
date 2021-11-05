Rails.application.routes.draw do
  root "gossips#index"

resources :sessions, only: [:new, :create, :destroy]
resources :users
resources :cities, only: [:show]
resources :gossips
get '/team', to: 'static_pages#team'
get '/contact', to: 'static_pages#contact'


end
