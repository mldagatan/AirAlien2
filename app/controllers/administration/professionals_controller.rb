class Administration::ProfessionalsController < AdministrationController
  def index
  end

  def for_approval
  	@pending_professionals = User.for_approval
  end

  def approve
  	@user = User.find(params[:id])
  	@user.update_attributes(user_level: 1)
  	redirect_to for_approval_administration_professionals_path, notice: "Yup, that guy is now a professional."
  end
end
