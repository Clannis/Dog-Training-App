class TrainingSession < ApplicationRecord
    belongs_to :trainer
    has_many :training_session_dogs
    has_many :dogs, through: :training_session_dogs
    belongs_to :course
end
