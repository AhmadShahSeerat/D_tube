class DesignsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
before_action :find_action, only: [:index, :new, :create]

def index 
    if @collage
    @designs = @collage.designs
    else  
        @designs = Design.all
    end
end

def edit  
    @design = Design.find_by(id: params[:id]) # we have to find this design first,
    render layout: "studio"
end

def update 
    @design = Design.find_by(id: params[:id]) # we have to find it here as well first 
    @design.update(design_params) # so as we find it we should update it based on the params we given

    if @design.valid? # recalling active record
        redirect_to design_path(@design)
    else  
        #flash messages 
        render :edit, layout: "studio"
    end
end

def most_recent 
    @design = Design.most_recent
 end

 def show
    @design = Design.find_by(id: params[:id])
    @comments = @design.comments
    @comment = Comment.new(user_id: current_user.id)
    @design.update(views: @design.views+1) 

    
end

def new 
    if @collage # if we have a collage i.e play list 
        @design = @collage.designs.build # then build a new design to collage and save it to @design
    else # if we dont have a collage then
    @design = Design.new # create a new design 
    @design.build_collage # and then build a collage associated to that design
    #so we create a new design collage to make an association of collage and design
    end
    render layout: "studio" 
end

def create
   @design = Design.new(design_params)
   if @design.save 
    if @collage 
        redirect_to collage_designs_path(@collage)
    else
    redirect_to design_path(@design)
    end
  else  
    #flash messages
    render :new, layout: "studio"
  end
end


def search 
    @designs = Design.search(params[:title])
        # as we search for it, it gives us all designs so we save it into @designs variable
    render :index
     # once shown to us, we can create new html for it, but its same as index, so lets render it
end 

def destroy 
    @design = Design.find_by(id: params[:id])
    @design.destroy #delete only deletes it from db but destroy deletes even its association if it has any
    redirect_to designs_path
end

private
    def design_params 
        params.require(:design).permit(:title, :description, :design_url, :collage_id, collage_attributes: [:name, :description])
    end
        def find_action
            @collage = Collage.find_by_id(params[:collage_id])
            # @collage = Collage.find(params[:collage_id])   if id doesnt exist then throws an error on us
        end 
end
