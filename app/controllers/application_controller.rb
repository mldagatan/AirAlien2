class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?

  def user_logged_in
		if !user_signed_in?
			redirect_to new_user_session_path, notice: "You need to sign in first."
		end
	end

	def prevent_administrator
		if administrator_signed_in?
			redirect_to root_path, notice: "You administrator youuuu.. Don't break things!"
		end
	end

	def prevent_user
		if user_signed_in?
			redirect_to root_path, notice: "Well. This is awkward."
		end
	end

  protected
  	def configure_permitted_paramters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description, :email, :password])
  	end

end
