class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show]
  def index
  	@professionals = Professional::User.all
  end

  def show
  end

  def apply
  	if current_user.user_level != 0
  		redirect_to professional_path(current_user)
  	end
  end

  def submit_application
  	@approval = User.find(params[:id]).build_approval(approval_params)
  	if @approval.save
  		redirect_to apply_professionals_path, notice: "Yup, we've gotten your application. We'll get back to you."
  	else
  		render 'apply'
  	end
  end

  private
  def set_professional
  	@professional = Professional::User.find(params[:id])
  end

  def approval_params
  	params.require(:approval).permit(:government_id_type, :government_id)
  end
end
