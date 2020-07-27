class User < ApplicationRecord
    has_many :dogs
    has_many :training_sessions, through: :dogs
    has_many :courses, through: :training_sessions
end
