Rails.application.routes.draw do
  resources :collages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/designs', to: 'designs#index' #index
  # get '/design/:id', to: 'designs#show' #show
  # get '/designs/:id/edit', to: 'designs#edit' #edit
  # put '/designs/:id', to: 'designs#update' #update  nc
  # delete '/designs/:id', to: 'designs#destroy' #destroy
  # get '/designs/new', to: 'designs#new' #new 
  # post '/designs', to: 'designs#create' #create


resources :designs #we can use this for only or except routes as well 

get '/most_recent', to: "designs#most_recent", as: 'recent' 
# The path itself works dynamically even if we change them it still works for us as recent_path 

get '/search', to: 'designs#search'
end
