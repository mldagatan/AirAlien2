class Service::Category < ActiveRecord::Base
	has_many :services, foreign_key: :service_category_id, class_name: "Service::Service"
	has_many :questions, as: :questionable
	has_many :answers, through: :questions
	has_many :professionals, through: :services

	validates :title, :description, :minimum_rate, :maximum_rate, presence: true
	validates :comission_percentage,
						presence: true,
						numericality: {
							less_than_or_equal_to: 100
						}
	validates :slug,
						presence: true,
						uniqueness: true

	before_validation :set_slug

	def to_param
		self.slug
	end

	private
	def set_slug
		if slug.blank?
			self.slug = title.parameterize
		else
			self.slug = slug.parameterize
		end
	end
end