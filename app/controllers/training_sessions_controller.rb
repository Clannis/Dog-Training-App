class TrainingSessionsController < ApplicationController
    def show
        @training_session = TrainingSession.find_by(id: params[:id])
    end

    def edit
        @training_session = TrainingSession.find_by(id: params[:id])
    end

    def update
        @training_session = TrainingSession.find_by(id: params[:id])
        @training_session.update(training_session_params)
        byebug
        redirect_to training_session_path(@training_session)
    end

    def destroy
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

    private

    def training_session_params
        params.require(:training_session).permit(:starts_at, :location)
    end
end
