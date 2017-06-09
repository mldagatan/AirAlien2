class Professional::User < User
  default_scope lambda {where("user_level != 0")}
  
  has_one :profile, foreign_key: :professional_user_id, class_name: "Professional::Profile"
  has_many :services, class_name: "Service::Service", foreign_key: :professional_id
  has_many :bookings, class_name: "Service::Bookings", through: :services
  has_many :service_categories, through: :services
  
end