class TrainingSessionsController < ApplicationController
    before_action :authenticate
    before_action :set_training_session
    before_action :set_course, only: [:new, :create, :index]
    skip_before_action :set_training_session, only: [:new, :create, :index]

    def show
        
    end

    def edit
        
    end

    def update
        if @training_session.update(training_session_params)
            redirect_to training_session_path(@training_session)
        else
            render 'edit'
        end
    end

    def destroy
        @training_session.training_session_dogs.each do |training_session_dog|
            training_session_dog.delete
        end
        @course = @training_session.course
        @training_session.delete
        redirect_to course_path(@course)
    end

    def new
        @training_session = TrainingSession.new()
    end

    def create
        @training_session = current_user.training_sessions.new(training_session_params.merge({course_id: @course.id}))
        if @training_session.save
            redirect_to training_session_path(@training_session)
        else
            render 'new'
        end
    end

    def select_dog 
        @user = current_user
        @dogs = Dog.users_dogs_by_name(@user)
    end

    def add_dog
        @dog = Dog.find(params[:dog_id])
        if @dog.shots
            @training_session.dogs << @dog
            redirect_to training_session_path(@training_session)
        else
            @dog.errors.add(:shots, "are not up to date. You cannot enroll #{@dog.name} in any courses.")
            @user = current_user
            @dogs = Dog.users_dogs_by_name(@user)
            render "select_dog"
        end
    end

    def index
        @user = current_user
        @training_sessions = @course.training_sessions
    end

    private

    def training_session_params
        params.require(:training_session).permit(:starts_at, :location)
    end

    def set_training_session
        @training_session = TrainingSession.find_by(id: params[:id])
    end

    def set_course
        @course = Course.find(params[:course_id])
    end
end
