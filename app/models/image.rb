class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  serialize :dimensions, Array

  has_attached_file :img,
  									styles: {
											xs_thumb: "75x75>",
											s_thumb: "150x150>",
											m_thumb: "250x250>",
											l_thumb: "500x500>",
											medium: "750x750>",
											large: "1200x1200>"
										},
										convert_options: {
											xs_thumb: "-quality 80",
											s_thumb: "-quality 80",
											m_thumb: "-quality 80",
											l_thumb: "-quality 80",
											medium: "-quality 80",
											large: "-quality 80",
										}

  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  before_save :extract_dimensions

  private
  def extract_dimensions
		geometry = Paperclip::Geometry.from_file(tempfile)
    self.dimensions = [geometry.width.to_i, geometry.height.to_i]
  end
end