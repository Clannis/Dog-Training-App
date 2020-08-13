class User < ApplicationRecord
    has_many :dogs
    has_many :training_sessions, through: :dogs
    has_many :courses, through: :training_sessions
    has_secure_password

    validates :username, uniqueness: true

    def name
        self.first_name.downcase.capitalize + " " + self.last_name.downcase.capitalize
    end

    def display_phone_number
        "(#{self.phone_number[0..2]}) #{self.phone_number[3..5]} - #{self.phone_number[6..9]}"
    end
end
