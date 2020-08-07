class TrainingSession < ApplicationRecord
    belongs_to :trainer
    has_many :training_session_dogs
    has_many :dogs, through: :training_session_dogs
    has_many :users, through: :dogs
    belongs_to :course

    def link_label
        if self.datetime && self.location
            "#{self.start_date} , #{self.location}"
        else
            "Add Training Session Start Date and Location."
        end
    end

    def start_date
        self.datetime.strftime("%b %d, %Y")
    end
end
