class TrainersController < ApplicationController

    include TrainersHelper

    def new
        @trainer = Trainer.new()
    end

    def create
        @trainer = Trainer.new(trainer_params)
        if @trainer.save
            session[:trainer_id] = @trainer.id
            redirect_to trainer_path(@trainer)
        else
            redirect_to new_trainer_path
        end
    end

    def show
        authenticate
        @trainer = Trainer.find_by(id: params[:id])
    end

    def edit
        @trainer = Trainer.find_by(id: params[:id])
    end

    def update
        @trainer = Trainer.find_by(id: params[:id])
        format_phone_number_input
        @trainer.update(trainer_params)
        redirect_to trainer_path(@trainer)
    end
    private

    def trainer_params
        params.require(:trainer).permit(:username, :first_name, :last_name, :phone_number, :email, :certification, :password)
    end

end
