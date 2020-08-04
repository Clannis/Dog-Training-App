class Trainer < ApplicationRecord
    has_many :training_sessions
    has_many :courses, through: :training_sessions
    has_many :dogs, through: :training_sessions
    has_many :users, through: :dogs

    has_secure_password
end
