class DogsController < ApplicationController
    before_action :authenticate

    def new
        @user = current_user
        @dog = @user.dogs.build
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user = User.find_by(id: session[:user_id])
        @dog.name = @dog.name.capitalize
        if @dog.save
            redirect_to user_dog_path(@dog.user, @dog)
        else
            render 'new'
        end
    end

    def index
        if params[:user_id]
            @user = current_user
            @dogs = Dog.users_dogs_by_name(current_user.id)
        else
            @dogs = Dog.all
        end
    end

    def show
        Dog.update_shot_records
        @user = User.find_by(id: session[:user_id])
        @dog = Dog.find_by(id: params[:id])
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        params[:dog][:name] = params[:dog][:name].capitalize
        if @dog.update(dog_params)
            redirect_to user_dog_path(@dog)
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find_by(id: session[:user_id])
        @dog = Dog.find(params[:id])
        @dog.training_session_dogs.each do |training_session_dog|
            training_session_dog.delete
        end
        @dog.delete
        redirect_to user_dogs_path(@user)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :last_shot_date)
    end
end
