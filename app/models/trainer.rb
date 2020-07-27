class Trainer < ApplicationRecord
    has_many :training_ssessions
    has_many :courses, through: :training_ssessions
    has_many :dogs, through: :training_ssessions
    has_many :users, through: :dogs
end
