class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end

  def new
    @sighting = Sighting.new
  end

  def create 
    @sighting = Sighting.new(sighting_params)
    if @sighting.save 
      redirect_to sighting_path(@sighting)
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def sighting_params
    params.require(:sighting).permit(:date, :location, :cryptid, :account)
  end
end

