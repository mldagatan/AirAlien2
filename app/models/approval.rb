class Approval < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :government_id, styles: {s_thumbnail: "75x75#", m_thumbnail: "250x250#", l_thumbnail: "500x500", view: "1200x1200>"}
  validates_attachment_content_type :government_id, content_type: /\Aimage\/.*\z/
end
