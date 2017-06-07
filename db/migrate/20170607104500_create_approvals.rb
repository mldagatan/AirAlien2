class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :government_id_type
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
