class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :role
      t.integer :beer_mats_count

      t.timestamps
    end
  end
end
