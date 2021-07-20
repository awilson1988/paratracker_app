class CommentsController < ApplicationController 
    def create 
        @sighting = Sighting.find(params[:sighting_id])
        @comment = @sighting.comments.create(params[:comment].permit(:name, :body)) 
        redirect_to sighting_path(@sighting)
    end 

    # def show 
    #     @comment = Comment.find_by_id(params[:id])
    # end

    def destroy 
        @sighting = Sighting.find(params[:sighting_id])
        @comment = @sighting.comments.find(params[:id])
        @comment.destroy 
        redirect_to sighting_path(@sighting) 
    end
end
