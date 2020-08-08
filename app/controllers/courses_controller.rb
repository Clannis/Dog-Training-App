class CoursesController < ApplicationController

    def new
        @course = Course.new()
    end

    def create
        trainer = Trainer.find_by(id: session[:trainer_id])
        @course = Course.find_or_create_by(course_params)
        byebug
        if @course.save
            @course.trainers << trainer
            redirect_to edit_training_session_path(@course.training_sessions.last)
        else
            redirect_to new_course_path
        end
    end

    def show
        authenticate
        @course = Course.find_by(id: params[:id])
    end

    def index
        if params[:dog_id]
            @dog = Dog.find(params[:dog_id])
        end
        @courses = Course.all
    end

    private

    def course_params
        params.require(:course).permit(:name, :length, :cost)
    end
end
