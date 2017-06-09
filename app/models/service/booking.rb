class Service::Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_service
end
