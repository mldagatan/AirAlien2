class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.decimal :minimum_rate, null: false, default: 0.00
      t.decimal :maximum_rate
      t.decimal :comission_percentage, null: false, default: 0.00
      t.string :slug, null: false, default: "", uniq: true

      t.timestamps null: false
    end
    add_index :service_categories, [:id, :slug]
  end
end
