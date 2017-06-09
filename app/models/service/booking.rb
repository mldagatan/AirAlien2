class Service::Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :service, class_name: "Service::Service", foreign_key: :service_service_id
  has_one :professional, through: :service
  has_one :address, as: :adressable
  has_one :payment, as: :payable

  validates_presence_of :address, if: :visit?
  validates :date,
  					presence: true,
  					uniqueness: {
  						scope: :professional
  					}

  def self.statuses
  	[
  		'pending',
  		'approved',
  		'moved',
  		'cancelled'
  	]
  end

  def status_readable
  	Service::Booking.statuses[self.status]
  end

  def visit?
  	service.visit?
  end

  def professional_id
  	professional.id
  end

  def payment_status
  	payment.status
  end

  def payment_status_readable
  	payment.status_readable
  end

  before_create :set_price

  private
  def set_price
  	if service.discount_price
  		self.price = service.discounted_rate
  	else
  		self.price = service.rate
  end
end