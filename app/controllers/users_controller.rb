class UsersController < ApplicationController
    def new
        @user = User.new()
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        authenticate
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :phone_number, :email, :password)
    end
end
