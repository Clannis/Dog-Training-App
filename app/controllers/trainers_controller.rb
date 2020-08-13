class TrainersController < ApplicationController

    include TrainersHelper

    def new
        @trainer = Trainer.new()
    end

    def create
        format_phone_number_input
        @trainer = Trainer.new(trainer_params)
        if @trainer.save
            session[:trainer_id] = @trainer.id
            redirect_to trainer_path(@trainer)
        else
            render 'new'
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
        if @trainer.update(update_trainer_params)
            redirect_to trainer_path(@trainer)
        else
            # cannot find why password error is added
            @trainer.errors.delete(:password) if @trainer.errors[:password] 
            render 'edit'
        end
    end
    private

    def trainer_params
        params.require(:trainer).permit(:username, :first_name, :last_name, :phone_number, :email, :certification, :password, :password_confirmation)
    end

    def update_trainer_params
        params.require(:trainer).permit(:username, :first_name, :last_name, :phone_number, :email, :certification)
    end

end
