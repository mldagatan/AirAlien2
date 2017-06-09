class Service::Service < ActiveRecord::Base
  belongs_to :professional
  belongs_to :service_category, class_name: "Service::Category", foreign_key: :service_category_id
  has_many :bookings, class_name: "Service::Booking", foreign_key: :service_service_id
  has_many :bookees, through: :bookings
  has_many :my_answers, class_name: "Service::MyAnswer", foreign_key: :service_service_id
  has_many :questions, through: :service_category
  has_many :images, as: :imageable
  has_one :address, as: :addressable

  validates :rate,
  					numericality: {
  						greater_than_or_equal_to: :maximum_rate,
  						less_than_or_equal_to: :minimum_rate
  					}
  validates :description,
  					presence: true,
  					length: {
  						minimum: 255,
  						maximum: 2000
  					}
  validates :title,
  					presence: true,
  					length: {
  						minimum: 10,
  						maximum: 500
  					}
  validates :discounted_rate,
  					numericality: {
  						less_than_or_equal_to: :rate
  					}

  def self.statuses
  	[
  		'pending',
  		'approved',
  		'cancelled',
  		'revision'
  	]
  end

  def status_readable
  	Service.statuses[self.status]
  end

  def maximum_rate
  	service_category.maximum_rate
  end

  def minimum_rate
  	service_category.minimum_rate
  end

  def visit?
  	address.location?
  end
end