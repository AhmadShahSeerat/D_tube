class CollagesController < ApplicationController
    layout "studio", only: [:new, :create, :edit, :update]
    def index 
        @collages = Collage.all
    end

    def show 
        @collage = Collage.find(params[:id])
    end

    def new 
        @collage = Collage.new
        3.times {@collage.designs.build} #or @collage.images << image.new
      
    end

    def create 
        @collage = Collage.new(collage_params)
        if @collage.save 
            redirect_to collage_path(@collage)
        else 
            #flash messages 
            render :new 
        end
    end
     
    def edit 
        @collage = Collage.find(params[:id])
        render layout: "studio"
    end
    
    def update 
        @collage = Collage.find_by(id: params[:id])
        @collage.update(collage_params)
         
        if @collage.valid?
            redirect_to collage_path(@collage)
        else 
            #todo flash messages 
            render :edit
    end
end

    def destroy 
        @collage = Collage.find_by(id: params[:id])
        @collage.destroy 
        redirect_to collages_path
    end

    private 
    def collage_params
        params.require(:collage).permit(:name, :description, designs_attributes: [:title, :description, :design_url])

    end

end
#association