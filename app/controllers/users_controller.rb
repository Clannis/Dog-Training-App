class UsersController < ApplicationController
    before_action :authenticate
    skip_before_action :authenticate, only: [:new, :create]

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
        page_owner_redirect
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        format_phone_number_input
        if @user.update(update_user_params)
            redirect_to user_path(@user)
        else
            # cannot find why password error is added
            @user.errors.delete(:password) if @user.errors[:password]   
            render "edit"
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
