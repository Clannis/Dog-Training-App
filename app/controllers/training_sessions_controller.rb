class TrainingSessionsController < ApplicationController
    def show
        authenticate
        @training_session = TrainingSession.find_by(id: params[:id])
    end

    def edit
        authenticate
        @training_session = TrainingSession.find_by(id: params[:id])
    end

    def update
        authenticate
        @training_session = TrainingSession.find_by(id: params[:id])
        @training_session.update(training_session_params)
        redirect_to training_session_path(@training_session)
    end

    def destroy
        authenticate
        @training_session = TrainingSession.find_by(id: params[:id])
        @course = @training_session.course
        @training_session.delete
        redirect_to course_path(@course)
    end

    def new
        authenticate
        @course = Course.find(params[:course_id])
        @training_session = TrainingSession.new()
    end

    def create
        authenticate
        @training_session = TrainingSession.new(training_session_params)
        @training_session.trainer = current_user
        @training_session.course = Course.find(params[:course_id])
        if @training_session.save
            redirect_to training_session_path(@training_session)
        else
            redirect_to new_training_session_path
        end
    end

    def add_dog
        authenticate
        @training_session = TrainingSession.find_by(id: params[:id])
        @dog = Dog.find(params[:dog_id])
        @training_session.dogs << @dog
        redirect_to user_dog_path(current_user, @dog)
    end

    def index
        @user = current_user
        @course = Course.find(params[:course_id])
        @training_sessions = @course.training_sessions
    end

    def user_add_dog
        @training_session = TrainingSession.find(params[:id])
        @user = User.find(params[:user_id])
        @dogs = Dog.owners_dogs(@user)
    end

    def add_dog_training_session
        @dog = Dog.find(params[:dog_id])
        @training_session= TrainingSession.find(params[:training_session_id])
        @dog.training_sessions << @training_session
        redirect_to user_dog_path(@dog.user, @dog)
    end

    private

    def training_session_params
        params.require(:training_session).permit(:starts_at, :location)
    end
end
