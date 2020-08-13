class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def authenticate
        redirect_to root_path if !logged_in?
    end

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        elsif session[:trainer_id]
            Trainer.find(session[:trainer_id])
        end
    end

    def logged_in_redirect
        if session[:user_id]
            redirect_to user_path(current_user)
        elsif session[:trainer_id]
            redirect_to trainer_path(current_user)
        end
    end

    def page_owner_redirect
        if session[:user_id]
            user = User.find(params[:id])
            if current_user != user
                redirect_to user_path(current_user)
            end
        end
    end
end
