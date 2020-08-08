class TrainingSessionDog < ApplicationRecord
    belongs_to :dog
    belongs_to :training_session

    validates_uniqueness_of :dog_id, scope: :training_session_id
end
