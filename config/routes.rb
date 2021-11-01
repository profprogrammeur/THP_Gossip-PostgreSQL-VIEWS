Rails.application.routes.draw do
  get 'gossip/home'
  get 'gossip/show'
  get 'hidden_page/welcome'
  get 'static_pages/contact'
  # get 'static_pages/team'
  # get 'static_pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# get '/team', to: '#team'
# get '/static_pages/contact', to: 'static_pages#contact'
# get '/static_pages/contact', to: 'static_pages#team'

get '/team', to: 'static_pages#team'
get '/contact', to: 'static_pages#contact'
get '/home0', to: 'static_pages#home'
get '/home', to: 'gossip#home'
get '/home/:gossip_id', to: 'gossip#show'
get '/team/:user_id', to: 'static_pages#team'
get '/welcome/:first_name', to: 'hidden_page#welcome'


end
