class CreateTrainingSessionDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :training_session_dogs do |t|
      t.integer :training_session_id
      t.integer :dog_id

      t.timestamps
    end
  end
end
