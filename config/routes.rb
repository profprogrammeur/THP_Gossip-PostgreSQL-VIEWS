Rails.application.routes.draw do
  root "gossips#index"
   get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
resources :sessions, only: [:new, :create, :destroy]
  get 'cities/show'
  # get 'users/show'
  # get 'gossip/home'
  # get 'gossip/show'
  # get 'hidden_page/welcome'
  # get 'static_pages/contact'

get '/team', to: 'static_pages#team'
get '/contact', to: 'static_pages#contact'
# get '/home', to: 'gossip#index'
# get '/home/:gossip_id', to: 'gossip#show'
# get '/team/:user_id', to: 'static_pages#team'
# get '/welcome/:first_name', to: 'hidden_page#welcome'

# get 'gossip/show', to: 'gossip#new'
# get 'gossip/new', to:  'gossip#create'


# resources :users, only: [:show]
resources :users
# resources :sessions, only: [:new, :create, :destroy]


# resources :cities, only: [:show]


resources :gossips

end
