class CoursesController < ApplicationController

    def new
        authenticate
        @course = Course.new()
    end

    def create
        authenticate
        trainer = Trainer.find_by(id: session[:trainer_id])
        @course = Course.find_or_create_by(course_params)
        if @course.save
            @course.trainers << trainer
            redirect_to edit_training_session_path(@course.training_sessions.last)
        else
            redirect_to new_course_path
        end
    end

    def show
        authenticate
        if params[:dog_id]
            @dog = Dog.find(params[:dog_id])
        end
        @course = Course.find_by(id: params[:id])
    end

    def index
        authenticate
        if params[:dog_id]
            @dog = Dog.find(params[:dog_id])
        end
        @courses = Course.all
    end
    
    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        @course.update(course_params)
        redirect_to course_path(@course)
    end

    def add_trick
        @course = Course.find(params[:course_id])
        @trick = Trick.find(params[:trick_id])
        @course.tricks << @trick 
        redirect_to course_path(@course)
    end

    private

    def course_params
        params.require(:course).permit(:name, :length, :cost)
    end
end
