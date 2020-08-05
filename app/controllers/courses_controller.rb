class CoursesController < ApplicationController

    def new
        @course = Course.new()
    end

    def create
        @course = Course.find_or_create_by(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            redirect_to new_course_path
        end
    end

    def show
        @course = Course.find_by(id: params[:id])
    end

    private

    def course_params
        params.require(:course).permit(:name, :length, :cost)
    end
end
