class Users::SessionsController < Devise::SessionsController
	before_action :prevent_administrator
end