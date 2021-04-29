Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create' 
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :cryptids
  resources :sightings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
