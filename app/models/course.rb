class Course < ApplicationRecord
    has_many :tricks
    has_many :training_sessions
    has_many :dogs, through: :training_sessions
    has_many :users, through: :dogs
end
