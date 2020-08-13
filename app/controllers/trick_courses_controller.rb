class TrickCoursesController < ApplicationController
    before_action :authenticate

    def destroy
        @trick_course = TrickCourse.find(params[:id])
        @course = @trick_course.course
        @trick_course.delete
        redirect_to course_path(@course)
    end
    
end
