class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :apply, :submit_application]
  def index
  	@professionals = User.where("user_level != 0")
  end

  def show
  end

  def apply
  	if @professional.approval && @professional.approval.approved
  		redirect_to professional_path(@professional)
  	else
  	end
  end

  def submit_application
  end

  private
  def set_professional
  	@professional = User.find(params[:id])
  end
end
