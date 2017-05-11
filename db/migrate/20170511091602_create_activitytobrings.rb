class CreateActivitytobrings < ActiveRecord::Migration
  def change
    create_table :activitytobrings do |t|
      t.string :item_name
      t.references :activity, index: true

      t.timestamps null: false
    end
    add_foreign_key :activitytobrings, :activities
  end
end
