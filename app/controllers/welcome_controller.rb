class WelcomeController < ApplicationController
    def welcome
        logged_in_redirect
    end
end
