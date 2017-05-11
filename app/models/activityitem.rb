class Activityitem < ActiveRecord::Base
  belongs_to :activity

  validates :item_type, presence: true
  validates :item_description, presence: true
end
