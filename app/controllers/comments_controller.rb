class CommentsController < ApplicationController
    include ApplicationHelper 
     before_action :find_user
     before_action :can_delete?, only: [:destroy]
    
     def create 
        @sighting = Sighting.find(params[:sighting_id])
        @comment = @sighting.comments.create(params[:comment].permit(:name, :body, :user_id))
        @comment.user_id = session[:user_id]
        if @comment.save 
            redirect_to sighting_path(@sighting) 
          else
            flash.now[:notice] = "Could not create comment."
            render :new 
          end
    end 

    def destroy
        @sighting = Sighting.find(params[:sighting_id])
        @comment = @sighting.comments.find(params[:id])
        @comment.destroy 
        redirect_to sighting_path(@sighting) 
    end

     private 

    def find_user
        @user = User.find_by_id(params[:user_id])
      end

    def can_delete?
        @sighting = Sighting.find(params[:sighting_id])
        @comment = @sighting.comments.find(params[:id])
        if !(@comment.user_id == session[:user_id])
          redirect_to user_path(current_user), alert: "You cannot edit a comment you didn't create"
        end
    end
end
