class UsersController < ApplicationController
  include ApplicationHelper 
  before_action :find_user

  def index
    @users = User.all
  end

  def new
    if !logged_in?
      @user = User.new
    else 
      redirect_to root_path
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user.id) 
    else
      flash.now[:notice] = "Could not create new user."
      render :new 
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @cryptid = Cryptid.find_by(params[:user_id])
  end

  def edit
    redirect_if_not_logged_in
    if @user == current_user
    else 
      redirect_to user_path(current_user)
    end 
  end

  def update
    @user.update(user_params)
    if @user.valid?
       redirect_to user_path(@user), flash: { alert: "Sucessfully Updated!" }
    else 
      render :edit 
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    user.delete
    redirect_to '/'
  end

  private 

  def user_params  
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

  def find_user
    @user = User.find_by_id(params[:id]) 
  end

  # def user_params(*args)
  #   params.require(:user).permit(*args) 
  # end 
end
