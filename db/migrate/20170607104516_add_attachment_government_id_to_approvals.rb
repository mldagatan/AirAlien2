class AddAttachmentGovernmentIdToApprovals < ActiveRecord::Migration
  def self.up
    change_table :approvals do |t|
      t.attachment :government_id
    end
  end

  def self.down
    remove_attachment :approvals, :government_id
  end
end
