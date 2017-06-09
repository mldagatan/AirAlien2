class CreateServiceServices < ActiveRecord::Migration
  def change
    create_table :service_services do |t|
      t.belongs_to :professional, index: true, foreign_key: true
      t.text :description
      t.decimal :rate
      t.decimal :discounted_rate
      t.integer :status
      t.belongs_to :service_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
