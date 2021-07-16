class CommentsController < ApplicationController 
    def create 
        @sighting = Sighting.find(params[:sighting_id])
        @comment = @sighting.comments.create(params[:comment].permit(:name, :body)) 
        redirect_to sighting_path(@sighting)
    end 
end
