class Course < ApplicationRecord
    has_many :trick_courses
    has_many :tricks, through: :trick_courses
    has_many :training_sessions
    has_many :dogs, through: :training_sessions
    has_many :users, through: :dogs
end
