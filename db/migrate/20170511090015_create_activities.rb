class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :subtitle
      t.text :what_to_do
      t.text :where_well_be
      t.text :notes
      t.references :experience, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :experiences
  end
end
