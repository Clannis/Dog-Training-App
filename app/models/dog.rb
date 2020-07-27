class Dog < ApplicationRecord
    belongs_to :user
    has_many :training_sessions
    has_many :trainers, through: :training_sessions
    has_many :courses, through: :training_sessions
end
