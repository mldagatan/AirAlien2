class AddFeaturedToUser < ActiveRecord::Migration
  def change
    add_column :users, :isFeatured, :boolean
  end
end
