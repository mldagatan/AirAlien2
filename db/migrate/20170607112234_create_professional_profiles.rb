class CreateProfessionalProfiles < ActiveRecord::Migration
  def change
    create_table :professional_profiles do |t|
      t.text :about_me
      t.belongs_to :professional_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
