class UsersController < ApplicationController
    before_action :authenticate
    before_action :page_owner_redirect
    before_action :set_current_user
    skip_before_action :set_current_user, only: [:new, :create]
    skip_before_action :authenticate, only: [:new, :create]
    skip_before_action :page_owner_redirect, only: [:new, :create]

    def new
        @user = User.new()
    end

    def create
        format_phone_number_input
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
        
        format_phone_number_input
        if @user.update(update_user_params)
            redirect_to user_path(@user)
        else
            # cannot find why password error is added
            @user.errors.delete(:password) if @user.errors[:password]   
            render "edit"
        end
    end

    def add_user_password
        
    end

    def update_user_password
        if @user.update(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
            byebug
            if @user.phone_number == "0"
                redirect_to edit_user_path(@user)
            else
                redirect_to user_path(@user)
            end
        else
            render "add_user_password"
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
    end

    def update_user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :email)
    end
end
