class TricksController < ApplicationController
    before_action :authenticate

    def new
        @course = Course.find(params[:course_id])
        @trick = Trick.new()
    end

    def create
        @course = Course.find(params[:course_id])
        @trick = Trick.new(trick_params)
        @trick.courses << @course
        if @trick.save
            redirect_to course_path(@course)
        else
            render 'new'
        end
    end

    def index
        if params[:course_id]
            @course = Course.find(params[:course_id])
        end
        @tricks = Trick.all
    end

    def show
        if params[:course_id]
            @course = Course.find(params[:course_id])
        end
        @trick = Trick.find(params[:id])
    end

    def edit
        @trick = Trick.find(params[:id])
    end

    def update
        @trick = Trick.find(params[:id])
        if @trick.update(trick_params)
            redirect_to trick_path(@trick)
        else
            render 'edit'
        end
    end
    private

    def trick_params
        params.require(:trick).permit(:name, :description, :difficulty_rating)
    end
end
