class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :github

    def new
        
    end
    
    def create
        byebug
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
        User.all.each do |user|
            if user.email.downcase == email
                @user = user
                session[:user_id] = user.id
            end
        end
        Trainer.all.each do |trainer|
            if trainer.email.downcase == email
                @trainer = trainer
                session[:trainer_id] = trainer.id
            end
        end
        if session[:trainer_id]
            redirect_to trainer_path(@trainer)
        elsif
            redirect_to user_path(@user)
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
