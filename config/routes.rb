Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  root('static#home')
  
  resources :collages do 
    resources :designs, only: [:index, :new, :create]
  end

  resources :designs do
  resources :comments, only: [:create]
  end
  
  get '/most_recent', to: "designs#most_recent", as: 'recent' # 3 for comments

  get '/search', to: 'designs#search'
end
