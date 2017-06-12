class Service::MyAnswer < ActiveRecord::Base
  belongs_to :booking, class_name: "Service::Booking", foreign_key: :service_booking_id
  belongs_to :answer
  has_one :user, through: :booking
  has_one :service, through: :booking
  has_one :question, through: :answer
  has_one :professional, through: :service

  validates :answer_id, presence: true
  validates_uniqueness_of :answer_id, scope: :service_booking_id
end