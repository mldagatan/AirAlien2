class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :first_line
      t.text :second_line
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.integer :address_type
      t.references :addressable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
