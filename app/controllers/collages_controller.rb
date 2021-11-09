class CollagesController < ApplicationController
    
    def index 
        @collages = Collage.all
    end

    def show 
        @collage = Collage.find_by(id: params[:id])
    end

    def new 
        @collage = Collage.find_by(id: params[:id])
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
        @collage = Collage.new
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

    def destroy 
        @collage = Collage.find_by(id: params[:id])
        @collage.destroy 
        redirect_to collages_path
    end

    private 
    def collage_params
        params.require(:collage).permit(:name, :description)
    end

end
