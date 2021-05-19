class CryptidsController < ApplicationController
  # before_action :can_edit?, only: [:edit, :update, :destroy]
  before_action :set_cryptid
  
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

  # def add_squonk 
  #    @cryptid = Cryptid.new(name: 'Squonk', description: 'Sounds cute!', user_id: current_user.id )
  #   @cryptid.save 



  # end

  def show
  end

  def edit
    redirect_if_not_logged_in
    if @user == current_user
    @cryptid = Cryptid.find_by_id(params[:id])
    else
    redirect_to user_path(current_user)
    end
  end

  def update
    @cryptid.update(cryptid_params)
    if @cryptid.valid?
      redirect_to cryptid_path(@cryptid), notice: "Cryptid Updated!"
    else 
      render :edit 
    end

  end

  def destroy
    @cryptid.destroy
    redirect_to cryptids_path
  end

  private 

  def set_cryptid 
    @cryptid = Cryptid.find_by_id(params[:id])
  end

  # def can_edit?
  #   if !(@cryptid.user == current_user)
  #     redirect_to sightings_path, alert: "You cannot edit a Cryptid you didn't create"
  #   end
  # end

  def cryptid_params 
    params.require(:cryptid).permit(:name, :description, :cryptid_id, :cryptids, :user_id)
  end
end
