class SessionsController < ApplicationController 

  def new 
    if logged_in? 
      redirect_to user_path(current_user)
  end 
end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to user_path(user.id) 
    else 
      flash[:message] = "Email and/or password invalid. Please try again."
      redirect_to login_path
    end
  end 

  def destroy
    session.delete(:user_id)
    redirect_to login_path 
  end 

  def omniauth 
    user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      u.first_name = request.env['omniauth.auth'][:info][:first_name]
      u.last_name = request.env['omniauth.auth'][:info][:last_name]
      u.email = request.env['omniauth.auth'][:info][:email]
      u.password = SecureRandom.hex(15)
    end 
    if user.valid?
      session[:user_id] = user.id 
      redirect_to user_path(user.id)
    else
      redirect_to login_path 
    end 
  end 
end 
