class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :title
      t.text :description
      t.decimal :minimum_rate
      t.decimal :maximum_rate
      t.decimal :comission_percentage

      t.timestamps null: false
    end
  end
end
