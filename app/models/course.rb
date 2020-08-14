class Course < ApplicationRecord
    has_many :trick_courses
    has_many :tricks, through: :trick_courses
    has_many :training_sessions
    has_many :trainers, through: :training_sessions
    has_many :training_session_dogs, through: :training_sessions
    has_many :dogs, through: :training_session_dogs
    has_many :users, through: :dogs

    validates :name, uniqueness: {case_sensitive: false}
    validates :name, :length, :cost, presence: true

    def training_session(dog)
        dog.training_sessions.each do |dog_training_session|
            if dog_training_session.course == self
                return dog_training_session
            end
        end
    end

    def trainer(trainer)
        self.training_sessions.each do |training_session|
            if training_session.trainer == trainer
                return true
            end
        end
        false
    end
end
