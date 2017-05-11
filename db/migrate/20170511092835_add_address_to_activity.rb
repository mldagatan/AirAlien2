class AddAddressToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :location_name, :string
    add_column :activities, :country, :string
    add_column :activities, :street_address, :string
    add_column :activities, :building, :string
    add_column :activities, :city, :string
    add_column :activities, :state, :string
    add_column :activities, :zipcode, :string
  end
end
