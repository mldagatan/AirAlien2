class Professional::User < User
  default_scope lambda {where("user_level != 0")}
  
  has_one :profile, foreign_key: :professional_user_id, class_name: "Professional::Profile"
end