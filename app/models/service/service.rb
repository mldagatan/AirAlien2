class Service::Service < ActiveRecord::Base
  belongs_to :professional
  belongs_to :service_category
end
