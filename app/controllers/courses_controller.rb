class CoursesController < ApplicationController

    def new
        @course = Course.new()
    end

    def create
        trainer = Trainer.find_by(id: session[:trainer_id])
        @course = Course.find_or_create_by(course_params)
        if @course.save
            @course.trainers << trainer
            redirect_to course_path(@course)
        else
            redirect_to new_course_path
        end
    end

    def show
        authenticate
        @course = Course.find_by(id: params[:id])
    end

    def index
        @courses = Course.all
    end

    private

    def course_params
        params.require(:course).permit(:name, :length, :cost)
    end
end
