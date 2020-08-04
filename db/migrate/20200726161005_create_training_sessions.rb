class CreateTrainingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :training_sessions do |t|
      t.datetime :starts_at
      t.string :location
      t.integer :trainer_id
      t.integer :dog_id
      t.integer :course_id

      t.timestamps
    end
  end
end
