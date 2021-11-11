Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#delete'

  get '/auth/google-oauth2/callback', to: 'sessions#omniauth'
# resources :users
  root('static#home')
  
  resources :collages do 
    resources :designs, only: [:index, :new, :create]  #or :resources shallow: true is kinda same
    #it creates a nested resources for us. /collages/:collage_id/all_designs_path USED INC
    # WE CAN USE REOSOURCES :DESIGNS, ONLY: [:DDD]... OR EXCEPT AS WELL.
    # OR WE CAN NESTED AGAIN AND AGAIN RESOURCES ANOTHER THEN DO AND THEN RESOURCES AND ON AND ON
    # IF WE HAVE MULTIPLE RESOURCES THE FIRST ONES COME RESOURCE IS ALWAYS LIKE COLLAGE_ID BUT THE LAST ONE WILL COME ONLY :ID
    #remmber when we have a route collages/dddddfdfjd;lfj/designs. it wont break, since it goes and reads index 
    #designs but we have to specify which routes to go and read their in the index of designs very important
  end
  resources :designs #we can use this for only or except routes as well 
  
  get '/most_recent', to: "designs#most_recent", as: 'recent' 
  # The path itself works dynamically even if we change them it still works for us as recent_path 
  
  get '/search', to: 'designs#search'
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# get '/designs', to: 'designs#index' #index
# get '/design/:id', to: 'designs#show' #show
# get '/designs/:id/edit', to: 'designs#edit' #edit
# put '/designs/:id', to: 'designs#update' #update  nc
# delete '/designs/:id', to: 'designs#destroy' #destroy
# get '/designs/new', to: 'designs#new' #new 
# post '/designs', to: 'designs#create' #create