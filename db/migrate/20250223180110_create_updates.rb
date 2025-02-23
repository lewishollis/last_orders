class CreateUpdates < ActiveRecord::Migration[8.0]
  def change
    create_table :updates do |t|
      t.text :content
      t.integer :bar_id

      t.timestamps
    end
  end
end
