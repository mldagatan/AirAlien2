class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.integer :type
      t.integer :status
      t.text :description
      t.text :parameters
      t.references :payable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
