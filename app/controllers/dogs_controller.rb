class DogsController < ApplicationController
    before_action :authenticate
    before_action :set_current_user
    before_action :set_dog
    skip_before_action :set_current_user, only: [:update, :edit]
    skip_before_action :set_dog, only: [:new, :create, :index]

    def new
        @dog = @user.dogs.build
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user = @user
        @dog.name = @dog.name.capitalize
        if @dog.save
            redirect_to user_dog_path(@dog.user, @dog)
        else
            render 'new'
        end
    end

    def index
        @dogs = Dog.users_dogs_by_name(current_user.id)
    end

    def show
        Dog.update_shot_records
    end

    def edit
        
    end

    def update
        params[:dog][:name] = params[:dog][:name].capitalize
        if @dog.update(dog_params)
            redirect_to user_dog_path(@dog)
        else
            render 'edit'
        end
    end

    def destroy
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

    def set_current_user
        @user = current_user
    end

    def set_dog
        @dog = Dog.find(params[:id])
    end
    
end
