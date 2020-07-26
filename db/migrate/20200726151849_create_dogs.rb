class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.boolean :shots
      t.datetime :last_shot_date
      t.string :image_path
      t.integer :user_id

      t.timestamps
    end
  end
end
