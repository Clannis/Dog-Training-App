class CoursesController < ApplicationController
    before_action :authenticate

    def new
        @course = Course.new()
    end

    def create
        trainer = Trainer.find_by(id: session[:trainer_id])
        @course = Course.find_or_create_by(course_params)
        if @course.save
            redirect_to new_course_training_session_path(@course)
        else
            render 'new'
        end
    end

    def show
        if params[:dog_id]
            @dog = Dog.find(params[:dog_id])
        end
        @course = Course.find_by(id: params[:id])
    end

    def index
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
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            render 'edit'
        end
    end

    def add_trick
        @course = Course.find(params[:course_id])
        @trick = Trick.find(params[:trick_id])
        if @course.tricks.include?(@trick)
            @course.errors.add(:trick, "already included in this course.")
            render "courses/show"
        else
            @course.tricks << @trick 
            redirect_to course_path(@course)
        end
        
    end

    private

    def course_params
        params.require(:course).permit(:name, :length, :cost)
    end
end
