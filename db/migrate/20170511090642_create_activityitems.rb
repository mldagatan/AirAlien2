class CreateActivityitems < ActiveRecord::Migration
  def change
    create_table :activityitems do |t|
      t.string :item_type
      t.text :item_description
      t.references :activity, index: true

      t.timestamps null: false
    end
    add_foreign_key :activityitems, :activities
  end
end
