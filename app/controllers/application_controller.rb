class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def authenticate
        redirect_to root_path if !logged_in?
    end
end
