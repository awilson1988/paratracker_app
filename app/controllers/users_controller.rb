class UsersController < ApplicationController
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
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id 
    redirect_to root_path 
    else 
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params(:username, :first_name, :last_name, :email))
    redirect_to user_path(@user)
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    user.delete
    redirect_to '/'
  end

  private 

  def user_params  
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
  end

  def user_params(*args)
    params.require(:user).permit(*args) 
  end
end
