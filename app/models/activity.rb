class Activity < ActiveRecord::Base
  belongs_to :experience
  has_many :actphotos

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  validates :title, presence: true
  validates :subtitle, presence: true
end
