class User < ApplicationRecord
    has_many :dogs
    has_many :training_sessions, through: :dogs
    has_many :courses, through: :training_sessions
    has_secure_password

    def name
        self.first_name.downcase.capitalize + " " + self.last_name.downcase.capitalize
    end
end
