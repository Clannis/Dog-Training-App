module ApplicationHelper

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        elsif session[:trainer_id]
            Trainer.find(session[:trainer_id])
        end
    end

    def logged_in?
        if session[:user_id]
            true
        elsif session[:trainer_id]
            true
        else
            false
        end
    end

    def logged_in_redirect
        if session[:user_id]
            redirect_to user_path(current_user)
        elsif session[:trainer_id]
            redirect_to trainer_path(current_user)
        end
    end

    def authenticate
        redirect_to root_path if !logged_in?
    end
end
