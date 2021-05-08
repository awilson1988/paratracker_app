module ApplicationHelper
    
    def current_user 
        current_user ||= User.find_by(id: session[:user_id]) #if session[user_id]
    end

    def logged_in? 
        !!current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
          redirect "/"
        end
    end 

    def sighting_owner?(sighting) 
        if current_user != sighting.user 
            flash[:error] = "Sorry, that sighting doesn't belong to you!" 
        end 
    end
end
