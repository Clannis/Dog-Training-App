class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :github

    def new
        
    end
    
    def create
        if params[:user]
            @user = User.find_by(username: params[:user][:username])
        elsif params[:trainer]
            @trainer = Trainer.find_by(username: params[:trainer][:username])
        end
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif @trainer
            session[:trainer_id] = @trainer.id
            redirect_to trainer_path(@trainer)
        else
            redirect_to login_path
        end
    end

    def github
        result = User.find_or_create_user_by_github(request.env['omniauth.auth']['info'])
        @created = result[:created]
        @user = result[:user]
        if @user
            session[:user_id] = @user.id
            if @created
                redirect_to add_user_password_path(@user)
            else
                redirect_to user_path(@user)
            end
        else
            @error = {User: "User not found with github."}
            render 'welcome/welcome'
        end
    end

    def destroy
        session.delete :user_id if :user_id
        session.delete :trainer_id if :trainer_id
        redirect_to root_path
    end

end
