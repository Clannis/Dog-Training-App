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

    def page_owner_redirect
        if session[:user_id]
            user = User.find(params[:id])
            if current_user != user
                redirect_to user_path(current_user)
            end
        end
    end

    def format_phone_number_input
        if params[:trainer]
            if !params[:trainer][:phone_number_1].empty? && !params[:trainer][:phone_number_2].empty? && !params[:trainer][:phone_number_3].empty?
                params[:trainer][:phone_number] = params[:trainer][:phone_number_1] + params[:trainer][:phone_number_2] + params[:trainer][:phone_number_3]
                params[:trainer].delete(:phone_number_1)
                params[:trainer].delete(:phone_number_2)
                params[:trainer].delete(:phone_number_3)
            end
        elsif params[:user]
            if !params[:user][:phone_number_1].empty? && !params[:user][:phone_number_2].empty? && !params[:user][:phone_number_3].empty?
                params[:user][:phone_number] = params[:user][:phone_number_1] + params[:user][:phone_number_2] + params[:user][:phone_number_3]
                params[:user].delete(:phone_number_1)
                params[:user].delete(:phone_number_2)
                params[:user].delete(:phone_number_3)
            end
        end
    end

    def trainer_logged_in?
        if session[:trainer_id]
            true
        else
            false
        end
    end

end
