class CryptidsController < ApplicationController
  def index
    @cryptids = Cryptid.cryps_sightings
  end

  def new
    @cryptid = Cryptid.new
  end

  def create
    @cryptid = Cryptid.new(cryptid_params)
    @cryptid.user_id = session[:user_id]
      if @cryptid.save 
        redirect_to @cryptid
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
    @cryptid.update(cryptid_params)
    if @cryptid.valid?
      redirect_to cryptid_path(@cryptid), notice: "Cryptid Updated!"
    else 
      render :edit 
    end

  end

  def destroy
    @cryptid = Cryptid.find_by_id(params[:id]) 
    @cryptid.destroy
    redirect_to cryptids_path
  end

  private

  def cryptid_params 
    params.require(:cryptid).permit(:name, :description, :cryptid_id, :cryptids, :user_id)
  end
end
