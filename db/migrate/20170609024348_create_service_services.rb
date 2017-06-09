class CreateServiceServices < ActiveRecord::Migration
  def change
    create_table :service_services do |t|
      t.belongs_to :professional, index: true, foreign_key: true
      t.text :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.decimal :rate, null: false
      t.decimal :discounted_rate
      t.integer :status, null: false, default: 0
      t.belongs_to :service_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
