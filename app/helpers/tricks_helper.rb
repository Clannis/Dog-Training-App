module TricksHelper

    def add_trick_to_course(course, trick)
        link_to "Add to #{course.name}", add_course_trick_path(course, trick)
    end
end
