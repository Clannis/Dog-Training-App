module ApplicationHelper

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

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        elsif session[:trainer_id]
            Trainer.find(session[:trainer_id])
        end
    end

    def is_current_trainer?(trainer)
        if current_user == trainer
            true
        else
            false
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

    def trainer_logged_in?
        if session[:trainer_id]
            true
        else
            false
        end
    end

end
