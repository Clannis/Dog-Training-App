class TrainingSessionDogsController < ApplicationController

    def destroy
        @training_session_dog = TrainingSessionDog.find(params[:id])
        @dog = @training_session_dog.dog
        byebug
        @training_session_dog.delete
        redirect_to user_dog_path(@dog.user, @dog)
    end
end
