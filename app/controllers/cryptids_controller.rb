class CryptidsController < ApplicationController
  def index
    @cryptids = Cryptid.all
  end

  def new
    @cryptid = Cryptid.new
  end

  def create
    @cryptid = Cryptid.new(cryptid_params)
      if @sighting.save 
        redirect_to @sighting
      else 
        render :new
    end
  end

  def show
    @cryptid = Cryptid.find_by_id(params[:id])
  end

  def edit
    @cryptid = Cryptid.find_by_id(params[:id])
  end

  def update
    @cryptid = Cryptid.find_by_id(params[:id]) 
    @cryptid.update(crytid_params(:name, :description))
  end

  def destroy
    @cryptid = Cryptid.find_by_id(params[:id]) 
    @cryptid.destroy
    redirect_to cryptids_path
  end

  private

  def cryptid_params 
    params.require(:cryptid).permit(:name, :description, :cryptid_id:[], cryptids)
  end
end
