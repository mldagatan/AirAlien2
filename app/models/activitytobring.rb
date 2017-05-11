class Activitytobring < ActiveRecord::Base
  belongs_to :activity

  validates :item_name
end
