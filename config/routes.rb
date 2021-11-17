Rails.application.routes.draw do

 
  
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  root('static#home') # 000 for comments
 
  
  resources :collages do 
    resources :designs, only: [:index, :new, :create]  # 1 for comments 
  end

  # 2 for comments
  resources :designs do
  resources :comments, only: [:create]
  end
  

  get '/most_recent', to: "designs#most_recent", as: 'recent' # 3 for comments

  get '/search', to: 'designs#search'
end

# 4 for comments



 # 0000 resources :users

# 11111111 or :resources shallow: true is kinda same
    #it creates a nested resources for us. /collages/:collage_id/all_designs_path USED INC
    # WE CAN USE REOSOURCES :DESIGNS, ONLY: [:DDD]... OR EXCEPT AS WELL.
    # OR WE CAN NESTED AGAIN AND AGAIN RESOURCES ANOTHER THEN DO AND THEN RESOURCES AND ON AND ON
    # IF WE HAVE MULTIPLE RESOURCES THE FIRST ONES COME RESOURCE IS ALWAYS LIKE COLLAGE_ID BUT THE LAST ONE WILL COME ONLY :ID
    #remmber when we have a route collages/dddddfdfjd;lfj/designs. it wont break, since it goes and reads index 
    #designs but we have to specify which routes to go and read their in the index of designs very important

    # 22222 we can use this for only or except routes as well 

      # 3333 The path itself works dynamically even if we change them it still works for us as recent_path 

      # get '/designs', to: 'designs#index' #index
# get '/design/:id', to: 'designs#show' #show
# get '/designs/:id/edit', to: 'designs#edit' #edit
# put '/designs/:id', to: 'designs#update' #update  nc
# delete '/designs/:id', to: 'designs#destroy' #destroy
# get '/designs/new', to: 'designs#new' #new 
# post '/designs', to: 'designs#create' #create
