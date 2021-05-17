class SightingsController < ApplicationController
  before_action :set_sighting, except: [:index, :new, :create, :show, :edit] #[:new, :show, :edit, :update, :destroy]
  
  def index #path: sightings_path
    if params[:user_id] && @user = User.find_by(id: params[:user_id])
      #@user = User.find_by(params[:user_id])
      @sightings = @user.sightings 
    else
      @sightings = Sighting.all 
    end
  end

  def new #path: new_sighting_path
     @sighting = Sighting.new
    #  if params[:user_id]
    #    @user = User.find_by(params[:user_id])
    #    @sighting = @user.sighting.build
    #  else 
    #    @sighting = Sighting.new
    #    @sighting.build_user
    #  end  
  end

  def create 
    redirect_if_not_logged_in
    @sighting = Sighting.new(sighting_params)
    @sighting.user_id = session[:user_id]
      if @sighting.save 
        redirect_to @sighting
      else
        
        render :new
      end
    #  if params[:user_id]
    #    @user = User.find_by(id: params[:user_id])
    #    @sighting = @user.sightings.build(sighting_params)
    #  else 
    #    @sighting = Sighting.new(sighting_params)
    #  end 

    #  if @sighting.save 
    #    redirect_to @sighting
    #  else 
    #    render :new
    #  end 
  end

  def show
    @sighting = Sighting.find_by_id(params[:id])

  #   if params[:user_id] # this is checking if this a nested route
  #     @user = User.find_by_id(params[:user_id])
  #     @sighting = Sighting.find_by_id(params[:sighting_id])
  #     # redirect_to user_sighting_path(@user)
  #   else #not in the nested route
  #     @sighting = Sighting.find_by_id(params[:id])
  #   end
  
   end

  def edit
    # redirect_if_not_logged_in
    # if @user == current_user
    #   render :edit
    # else 
    #   redirect_to user_path(current_user)
    # end 
  
  end

  def update
    @sighting = Sighting.find_by_id(params[:id]) 
    @sighting.update(sighting_params)
    if @sighting.valid?
      redirect_to sighting_path(@sighting), notice: "Sighting Updated!"
    else
      render :edit 
    end
  end
    # @sighting.update(sighting_params(:account))
  

  def destroy
    @sighting = Sighting.find_by_id(params[:id]) 
    @sighting.destroy
    redirect_to sightings_path
  end

  private 

  def set_sighting 
    @sighting = Sighting.find_by_id(params[:id])
  end

  def sighting_params
    params.require(:sighting).permit(:date, :location, :account, :user_id, :cryptid_id)
  end
end

