class Professional::Profile < ActiveRecord::Base
  belongs_to :professional_user, foreign_key: :professional_user_id, class_name: "Professional::User"
end