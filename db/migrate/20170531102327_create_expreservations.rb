class CreateExpreservations < ActiveRecord::Migration
  def change
    create_table :expreservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :experience, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
