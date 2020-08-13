module CoursesHelper

    def course_edit_link
        if session[:trainer_id]
            link_to 'Edit this course', edit_course_path(@course)
        end
    end

    def remove_trick_from_course_button(trick, course)
        if session[:trainer_id]
            button_to "Remove trick from Course", trick.trick_course(course) , method: :delete
        end
    end

    def add_trick_to_to_course_link(course)
        if session[:trainer_id]
            link_to 'Add Trick to Course', course_tricks_path(course)
        end
    end

    def training_session_exists_path(training_session)
        if training_session.link_label == "Add Training Session Start Date and Location."
            edit_training_session_path(training_session)
        else
            training_session_path(training_session)
        end
    end
end
