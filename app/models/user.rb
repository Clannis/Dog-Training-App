class User < ApplicationRecord
    has_many :dogs
    has_many :training_sessions, through: :dogs
    has_many :courses, through: :training_sessions
    has_secure_password

    validates :username, uniqueness: true, on: :create
    validates :email, uniqueness: true
    validates :username, :first_name, :last_name, :phone_number, :email, presence: true
    validates :password, presence: true, on: :create
    validates :phone_number, numericality: { only_integer: true }
    validates :password, confirmation: { case_sensitive: true}

    def name
        self.first_name.downcase.capitalize + " " + self.last_name.downcase.capitalize
    end

    def display_phone_number
        "(#{self.phone_number[0..2]}) #{self.phone_number[3..5]} - #{self.phone_number[6..9]}"
    end

    def self.find_user(email)
        user = where(email: email)
        if user.count > 1
            nil
        else
            user.first
        end
    end

    def self.find_or_create_user_by_github(resource)
        result = {created: false}
        user = self.find_user(resource['email'].downcase)
        if !user
            name = resource['name'].split(" ")
            user = self.create(
                first_name: name[0], 
                last_name: (name[1] ? name[1] : "Add Last Name"), 
                username: resource['nickname'],
                phone_number: 0000000000,
                email: resource['email'].downcase,
                password: "add_password",
                password_confirmation: "add_password"
            )
            result[:created] = true
        end
        result[:user] = user
        result
    end
end
