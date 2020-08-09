class TrickCourse < ApplicationRecord
    belongs_to :course
    belongs_to :trick

    validates_uniqueness_of :trick_id, scope: :course_id

end
