class Trick < ApplicationRecord
    has_many :trick_courses
    has_many :courses, through: :trick_courses

    validates :name, uniqueness: {case_sensitive: false}
    validates :name, :description, :difficulty_rating, presence: true

    def trick_course(course)
        if self.trick_courses.count == 0
            nil
        else
            result = nil
            self.trick_courses.each do |trick_course|
                if trick_course.course == course
                    result = trick_course
                end
            end
            result
        end
    end

    def is_taught?
        if self.courses.count > 0
            true
        else
            false
        end
    end
end
