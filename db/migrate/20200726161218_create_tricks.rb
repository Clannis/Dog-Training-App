class CreateTricks < ActiveRecord::Migration[6.0]
  def change
    create_table :tricks do |t|
      t.string :name
      t.text :description
      t.integer :difficulty_rating

      t.timestamps
    end
  end
end
