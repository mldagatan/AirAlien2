class Service::MyAnswer < ActiveRecord::Base
  belongs_to :service, class_name: "Service::Service", foreign_key: :service_service_id
  belongs_to :answer
  has_one :question, through: :answer
  has_one :professional, through: :service

  validates :answer_id, :service_service_id, presence: true
  validates_uniqueness_of :answer_id, scope: :service_service_id
end