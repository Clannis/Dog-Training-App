class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :certification
      t.string :image_path

      t.timestamps
    end
  end
end
