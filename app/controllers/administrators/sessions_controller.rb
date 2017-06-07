class Administrators::SessionsController < Devise::SessionsController
	before_action :prevent_user
end