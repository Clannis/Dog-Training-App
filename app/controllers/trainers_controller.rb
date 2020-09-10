class TrainersController < ApplicationController
    include TrainersHelper
    before_action :authenticate
    before_action :set_trainer, only: [:show, :edit, :update]
    skip_before_action :authenticate, only: [:new, :create]

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
        
    end

    def edit
        
    end

    def update
        format_phone_number_input
        if params[:avatar]
            @trainer.avatar.purge 
        end
        if @trainer.update(update_trainer_params)
            redirect_to trainer_path(@trainer)
        else
            # cannot find why password error is added
            @trainer.errors.delete(:password) if @trainer.errors[:password] 
            render 'edit'
        end
    end

    def index
        @trainers = Trainer.all
    end
    private

    def trainer_params
        params.require(:trainer).permit(:username, :first_name, :last_name, :phone_number, :email, :certification, :password, :password_confirmation, :avatar)
    end

    def update_trainer_params
        params.require(:trainer).permit(:username, :first_name, :last_name, :phone_number, :email, :certification, :avatar)
    end

    def set_trainer
        @trainer = Trainer.find_by(id: params[:id])
    end
end
