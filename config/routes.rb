Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'registrations#signup'
  
  post '/uniqueId', to: 'sessions#uniqueId'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in?'
  
  post '/getList', to: 'contents#getList'

  resources :categories
  get '/count', to: 'categories#listAndCount'
  
  resources :contents
end
