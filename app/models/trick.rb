class Trick < ApplicationRecord
    has_many :trick_courses
    has_many :courses, through: :trick_courses
end
