class Service::Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :service, class_name: "Service::Service", foreign_key: :service_service_id
  has_one :professional, class_name: "Professional::User", foreign_key: :professional_user_id
  has_one :address, as: :addressable
  has_one :payment, as: :payable
  has_many :my_answers, class_name: "Service::MyAnswer", foreign_key: :service_booking_id

  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true  
  accepts_nested_attributes_for :my_answers, reject_if: :all_blank, allow_destroy: true  

  # validates_presence_of :address, if: :visit?
  validates :date,
  					presence: true,
  					uniqueness: {
  						scope: :professional_user_id
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

  def payment_status
  	payment.status
  end

  def payment_status_readable
  	payment.status_readable
  end

  before_create :set_price
  before_create :set_create_status

  private
  def set_price
  	if service.discounted_rate.present?
  		self.price = service.discounted_rate
  	else
  		self.price = service.rate
    end
  end

  def set_create_status
    self.status = 0
  end
end