class AddAttachmentImageToActphotos < ActiveRecord::Migration
  def self.up
    change_table :actphotos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :actphotos, :image
  end
end
