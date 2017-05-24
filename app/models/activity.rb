class Activity < ActiveRecord::Base
  belongs_to :experience

  validates :title, presence: true
  validates :subtitle, presence: true
end
