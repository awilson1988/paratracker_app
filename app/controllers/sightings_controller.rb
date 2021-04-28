class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end

  def new
    @sighting = Sighting.new
  end

  def create 
    binding.pry
    @sighting = Sighting.new(sighting_params)
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
  
  end

  def destroy
  end

  private 

  def sighting_params
    params.require(:sighting).permit(:date, :location, :account, :user_id, :cryptid_id)
  end
end

