class AddStatusToExpreservation < ActiveRecord::Migration
  def change
    add_column :expreservations, :status, :boolean
  end
end
