module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image
		else
			"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
		end
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
	   @devise_mapping = Devise.mappings[:user]
	end

end
