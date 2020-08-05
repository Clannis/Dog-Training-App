class TrainingSessionsController < ApplicationController
    def show
        @training_session = TrainingSession.find_by(id: params[:id])
    end
end
