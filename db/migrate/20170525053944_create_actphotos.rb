class CreateActphotos < ActiveRecord::Migration
  def change
    create_table :actphotos do |t|
      t.references :activity, index: true

      t.timestamps null: false
    end
    add_foreign_key :actphotos, :activities
  end
end
