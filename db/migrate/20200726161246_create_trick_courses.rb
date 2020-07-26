class CreateTrickCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :trick_courses do |t|
      t.integer :course_id
      t.integer :trick_id

      t.timestamps
    end
  end
end
