class Dog < ApplicationRecord
    belongs_to :user
    has_many :training_session_dogs
    has_many :training_sessions, through: :training_session_dogs
    has_many :trainers, through: :training_sessions
    has_many :courses, through: :training_sessions

    scope :users_dogs_by_name, -> (current_user) { where("user_id =?", current_user).order("name asc")}
    
    def date_of_shots
        self.last_shot_date.strftime("%B %d, %Y")
    end

    def self.update_shot_records
        Dog.all.each do |dog|
            if (dog.last_shot_date + 1.year) <= Date.current
                dog.update(shots: false)
            else
                dog.update(shots: true)
            end
        end
    end

    def self.owners_dogs(owner)
        where(user_id: owner)
    end
end
