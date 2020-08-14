module TricksHelper

    def add_trick_to_course(course, trick)
        link_to "Add to #{course.name}", add_course_trick_path(course, trick)
    end

    def trick_link(trick: trick, course: course)
        if course
            link_to trick.name, course_trick_path(course, trick)
        else
            link_to trick.name, trick_path(trick)
        end
    end
end
