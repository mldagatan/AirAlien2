class CreateServiceMyAnswers < ActiveRecord::Migration
  def change
    create_table :service_my_answers do |t|
      t.belongs_to :service_booking, index: true, foreign_key: true
      t.belongs_to :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
