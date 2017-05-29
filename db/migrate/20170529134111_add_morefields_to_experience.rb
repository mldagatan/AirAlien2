class AddMorefieldsToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :host_bio, :text
    add_column :experiences, :price, :integer
    add_column :experiences, :price_currency, :string
    add_column :experiences, :prep_time, :integer
    add_column :experiences, :cutoff_time, :integer
    add_column :experiences, :context_for_guests, :text
  end
end
