class AddAttachmentImageToExpphotos < ActiveRecord::Migration
  def self.up
    change_table :expphotos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :expphotos, :image
  end
end
