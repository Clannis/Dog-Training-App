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

    private

    def training_session_params
        params.require(:training_session).permit(:datetime, :location)
    end
end
