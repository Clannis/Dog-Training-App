class TrainingSession < ApplicationRecord
    belongs_to :trainer
    has_many :training_session_dogs
    has_many :dogs, through: :training_session_dogs
    has_many :users, through: :dogs
    belongs_to :course

    def link_label
        if self.starts_at && self.location
            "#{self.starts_at} , #{self.location}"
        else
            "Add Training Session Start Date and Location."
        end
    end

    def start_date
        self.starts_at.strftime("%b %d, %Y")
    end
end
