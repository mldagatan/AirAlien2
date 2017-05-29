module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase 
		if user.image
			user.image
		else
			"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
		end
	end

	
	def add_active_to_classes(location = root_path, active_name = nil, class_names)
	  classes = ""

	  if class_names.present?
	  	classes += class_names
	  end

	  if active_name.present?
	  	if location.present?
	  		if current_page?(location)
	  			classes += " " + active_name
	  		end
	  	end
	  end

	  classes
	end
end
