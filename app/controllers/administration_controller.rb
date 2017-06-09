class AdministrationController < ApplicationController
	before_action :prevent_user
	before_action :prevent_guest

	layout 'administration'

	private
	def prevent_guest
		if !administrator_signed_in?
			redirect_to root_path, notice: "You must be lost hooman."
		end
	end
end