class TrainingSession < ApplicationRecord
    belongs_to :trainer
    belongs_to :dog
    belongs_to :course
end
