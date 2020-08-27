class CoursesController < ApplicationController
    before_action :authenticate
    before_action :set_course, only: [:edit, :update, :show]
    before_action :set_dog, only: [:show, :index]

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
        
    end

    def index
        @courses = Course.all
    end
    
    def edit
        
    end

    def update
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            render 'edit'
        end
    end

    def add_trick
        @course = Course.find_by(id: params[:course_id])
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

    def set_course
        @course = Course.find_by(id: params[:id])
    end

    def set_dog
        if params[:dog_id]
            @dog = Dog.find(params[:dog_id])
        end
    end
end
