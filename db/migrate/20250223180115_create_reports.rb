class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports do |t|
      t.string :report_type
      t.text :content
      t.integer :admin_id

      t.timestamps
    end
  end
end
