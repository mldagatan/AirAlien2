class CreateExprequires < ActiveRecord::Migration
  def change
    create_table :exprequires do |t|
      t.boolean :is_legal
      t.text :certification
      t.text :extra_require
      t.references :experience, index: true

      t.timestamps null: false
    end
    add_foreign_key :exprequires, :experiences
  end
end
