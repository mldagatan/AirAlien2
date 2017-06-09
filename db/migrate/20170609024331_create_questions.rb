class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :label
      t.text :question
      t.references :questionable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
