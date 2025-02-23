class CreateBars < ActiveRecord::Migration[8.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :opening_hours
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
