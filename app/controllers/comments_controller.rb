class CommentsController < ApplicationController
    
    def create
        @design = Design.find_by_id(params[:design_id])
        @comment = @design.comments.build(comment_params)
        if @comment.save
            flash[:message] = "YOU JUST COMMENTED"
            redirect_to design_path(@design)
        else
            flash[:message] = "BRO DIDNT WORK"
            redirect_to design_path(@design)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :design_id, :user_id)
    end
end