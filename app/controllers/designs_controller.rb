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
    @design = Design.find_by(id: params[:id]) 
    render layout: "studio"
end

def update 
    @design = Design.find_by(id: params[:id]) 
    @design.update(design_params) 
    if @design.valid?
        redirect_to design_path(@design)
    else   
        render :edit, layout: "studio"
    end
end

def most_recent 
    @design = Design.most_recent
 end

 def show
    @design = Design.find_by(id: params[:id])
    @comments = @design.comments
    @comment = Comment.new(user_id: current_user.id) if logged_in?
    
    @design.update(views: @design.views+1)
end

def new 
    if @collage
        @design = @collage.designs.build 
    else 
    @design = Design.new 
    @design.build_collage 
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
    render :new, layout: "studio"
  end
end


def search 
    @designs = Design.search(params[:title])
    render :index
end 

def destroy 
    @design = Design.find_by(id: params[:id])
    @design.destroy
    redirect_to designs_path
end

private
    def design_params 
        params.require(:design).permit(:title, :description, :design_url, :collage_id, collage_attributes: [:name, :description])
    end
    def find_action
        @collage = Collage.find_by_id(params[:collage_id])
    end 
end
