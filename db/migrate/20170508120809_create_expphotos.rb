class CreateExpphotos < ActiveRecord::Migration
  def change
    create_table :expphotos do |t|
      t.references :experience, index: true

      t.timestamps null: false
    end
    add_foreign_key :expphotos, :experiences
  end
end
