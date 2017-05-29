class Experience < ActiveRecord::Base
  belongs_to :user
  has_many :expphotos
  has_many :activities

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  validates :day_type, presence: true
  validates :city, presence: true
  validates :category, presence: true
  validates :language, presence: true
  validates :experience_name, presence: true, length: {maximum: 50}
  validates :experience_tagline, presence: true, length: {maximum: 500}
end
