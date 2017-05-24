class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :subtitle
      t.text :what_to_do
      t.string :where_well_be
      t.text :notes
      t.string :location_name
      t.string :country
      t.string :street_address
      t.string :building
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :experience, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :experiences
  end
end
