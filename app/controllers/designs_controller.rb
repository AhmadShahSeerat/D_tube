class DesignsController < ApplicationController

def index 
    @designs = Design.all
end


def edit  
    @design = Design.find_by(id: params[:id]) # we have to find this image first,
end

def update 
    @design = Design.find_by(id: params[:id]) # we have to find it here as well first 
    @design.update(design_params) # so as we find it we should update it based on the params we given

    if @design.valid? # recalling active record
        redirect_to design_path(@design)
    else  
        #flash messages 
        render :edit 
    end

end

def most_recent 
    @design = Design.most_recent
 end

 def show
    @design = Design.find_by(id: params[:id])
    # @design.views +=1 
    # @design.save
    
     @design.update(views: @design.views+1)  
     
end

def new 
    @design = Design.new # if we dont have this here then our form wont open, it expects an argument
end

def create
   @design = Design.new(design_params)
   if @design.save 
    redirect_to design_path(@design)
  else  
    #flash messages
    render :new 
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
    params.require(:design).permit(:title, :description, :design_url)
end

end
