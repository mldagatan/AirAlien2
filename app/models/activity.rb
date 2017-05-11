class Activity < ActiveRecord::Base
  belongs_to :experience

  has_many :activityitems
  has_many :activitytobring

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :what_to_do, presence: true, length: {maximum: 500}
  validates :where_well_be, presence: true, length: {maximum: 300}
  validates :notes, presence: true, length: {maximum: 300}
  validates :location_name, presence: true
  validates :country, presence: true
  validates :street_address, presence: true
  validates :building, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
