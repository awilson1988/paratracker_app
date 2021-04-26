class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end

  def new
    @sighting = Sighting.new
  end

  def create 
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

