class CreateBeerMats < ActiveRecord::Migration[8.0]
  def change
    create_table :beer_mats do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :bar_id

      t.timestamps
    end
  end
end
