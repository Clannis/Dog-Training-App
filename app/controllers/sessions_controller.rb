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
        if !@user.nil?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif !@trainer.nil?
            session[:trainer_id] = @trainer.id
            redirect_to trainer_path(@trainer)
        else
            redirect_to login_path
        end
    end

    def github
        email = request.env['omniauth.auth']['info']['email'].downcase
        user = User.find_user(email)
        trainer = Trainer.find_trainer(email)
        if trainer
            session[:trainer_id] = trainer.id
            redirect_to trainer_path(trainer)
        elsif user
            session[:user_id] = user.id
            redirect_to user_path(user)
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
