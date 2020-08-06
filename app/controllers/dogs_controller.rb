class DogsController < ApplicationController
    def new
        @user = User.find_by(id: params[:user_id])
        @dog = @user.dogs.build
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user = User.find_by(id: session[:user_id])
        if @dog.save
            byebug
            redirect_to user_path(@dog.user)
        else
            byebug
            redirect_to new_user_dog_path
        end
    end

    def index
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @dogs = @user.dogs
        else
            @dogs = Dog.all
        end
    end

    def show
        byebug
        Dog.update_shot_records
        @user = User.find_by(id: session[:user_id])
        @dog = Dog.find_by(id: params[:id])
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to user_dog_path(@dog)
    end

    def destroy
        @user = User.find_by(id: session[:user_id])
        @dog = Dog.find(params[:id])
        @dog.delete
        redirect_to user_path(@user)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :last_shot_date)
    end
end
