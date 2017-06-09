class CreateServiceBookings < ActiveRecord::Migration
  def change
    create_table :service_bookings do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :service_service, index: true, foreign_key: true
      t.datetime :date
      t.integer :status
      t.decimal :price

      t.timestamps null: false
    end
  end
end
