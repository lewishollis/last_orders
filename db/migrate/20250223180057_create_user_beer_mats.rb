class CreateUserBeerMats < ActiveRecord::Migration[8.0]
  def change
    create_table :user_beer_mats do |t|
      t.integer :user_id
      t.integer :beer_mat_id
      t.datetime :scanned_at

      t.timestamps
    end
  end
end
