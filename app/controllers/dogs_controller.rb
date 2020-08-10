class DogsController < ApplicationController
    def new
        authenticate
        @user = User.find_by(id: params[:user_id])
        @dog = @user.dogs.build
    end

    def create
        authenticate
        @dog = Dog.new(dog_params)
        @dog.user = User.find_by(id: session[:user_id])
        if @dog.save
            redirect_to user_dog_path(@dog.user, @dog)
        else
            redirect_to new_user_dog_path
        end
    end

    def index
        authenticate
        if params[:user_id]
            @user = current_user
            @dogs = Dog.users_dogs_by_name(current_user.id)
        else
            @dogs = Dog.all
        end
    end

    def show
        authenticate
        Dog.update_shot_records
        @user = User.find_by(id: session[:user_id])
        @dog = Dog.find_by(id: params[:id])
    end

    def edit
        authenticate
        @dog = Dog.find(params[:id])
    end

    def update
        authenticate
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to user_dog_path(@dog)
    end

    def destroy
        authenticate
        @user = User.find_by(id: session[:user_id])
        @dog = Dog.find(params[:id])
        @dog.delete
        redirect_to user_dogs_path(@user)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :last_shot_date)
    end
end
