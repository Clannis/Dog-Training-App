class User < ApplicationRecord
    has_many :dogs
    has_many :training_sessions, through: :dogs
    has_many :courses, through: :training_sessions
    has_secure_password

    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :username, :first_name, :last_name, :phone_number, :email, :password, presence: true
    validates :phone_number, numericality: { only_integer: true }
    validates :password, confirmation: { case_sensitive: true}

    def name
        self.first_name.downcase.capitalize + " " + self.last_name.downcase.capitalize
    end

    def display_phone_number
        "(#{self.phone_number[0..2]}) #{self.phone_number[3..5]} - #{self.phone_number[6..9]}"
    end
end
