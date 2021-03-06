class ApplicationController < ActionController::Base  
    include ApplicationHelper 
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end
    
    def welcome 
        if !logged_in?
            redirect_to login_path
        end
    end
end

