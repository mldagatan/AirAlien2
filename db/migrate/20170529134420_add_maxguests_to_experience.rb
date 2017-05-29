class AddMaxguestsToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :max_guests, :integer
  end
end
