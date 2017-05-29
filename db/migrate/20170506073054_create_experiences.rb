class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :day_type
      t.string :city
      t.string :category
      t.string :language
      t.string :experience_name
      t.string :experience_tagline
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :experiences, :users
  end
end
