class SightingsController < ApplicationController
  def index #path: sightings_path
    @sightings = Sighting.all 
  end

  def new #path: new_sighting_path
    @sighting = Sighting.new 
  end

  def create 
    @sighting = Sighting.new(sighting_params)
    @sighting.user_id = session[:user_id]
      if @sighting.save 
        redirect_to @sighting
      else 
        render :new
      end
  end

  def show
    @sighting = Sighting.find_by_id(params[:id])
  end

  def edit
    @sighting = Sighting.find_by_id(params[:id])
  end

  def update
    @sighting = Sighting.find_by_id(params[:id]) 
    @sighting.update(sighting_params(:account))
  end

  def destroy
    @sighting = Sighting.find_by_id(params[:id]) 
    @sighting.destroy
    redirect_to sightings_path
  end

  private 

  def sighting_params
    params.require(:sighting).permit(:date, :location, :account, :user_id, :cryptid_id)
  end
end

