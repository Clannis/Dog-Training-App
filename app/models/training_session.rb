class TrainingSession < ApplicationRecord
    belongs_to :trainer
    has_many :training_session_dogs
    has_many :dogs, through: :training_session_dogs
    has_many :users, through: :dogs
    belongs_to :course

    validates :starts_at, uniqueness: {scope: :trainer_id}
    validates :starts_at, :location, presence: true

    def link_label
        if self.starts_at && self.location
            "#{self.start_date} , #{self.location}"
        else
            "Add Training Session Start Date and Location."
        end
    end

    def start_date
        self.starts_at.strftime("%b %d, %Y")
    end
    
    def training_session_dog(dog)
        if self.training_session_dogs.count == 0
            nil
        else
            result = nil
            self.training_session_dogs.each do |training_session_dog|
                if training_session_dog.dog == dog
                    result =  training_session_dog
                end
            end
            result
        end
    end

    def is_current_trainers?(trainer)
        if self.trainer == trainer
            true
        else
            false
        end
    end
end
