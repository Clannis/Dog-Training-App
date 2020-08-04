class DogsController < ApplicationController
    def new
        @dog = Dog.new()
    end

    def create
        @dog = Dog.new(dog_params)
        byebug
        if @dog.save
            redirect_to user_path(User.find(id: session[:user_id]))
        else
            redirect_to new_dog_path
        end
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :last_shot_date)
    end
end
