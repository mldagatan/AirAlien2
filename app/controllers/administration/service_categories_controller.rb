class Administration::ServiceCategoriesController < AdministrationController
	before_action :set_service_category, only: [:edit, :update, :destroy]
  def index
  	@service_categories = Service::Category.all
  end

  def new
  	@service_category = Service::Category.new
  	@service_category.questions.build.answers.build
  end

  def create
  	@service_category = Service::Category.new(service_params)

  	if @service_category.save
  		redirect_to edit_administration_service_category_path(@service_category), notice: "Successfully created #{@service_category.title}."
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @service_category.update_attributes(service_params)
  		redirect_to edit_administration_service_category_path(@service_category), notice: "Successfully updated #{@service_category.title}."
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@service_category.destroy
  	redirect_to administration_service_categories_path, notice: "Successfully deleted #{@service_category.title}."
  end

  private
  def set_service_category
  	@service_category = Service::Category.find_by_slug(params[:id])
  end

  def service_params
  	params.require(:service_category).permit(
  		:title, :description, :slug, :minimum_rate, :maximum_rate, :commission_percentage,
  		questions_attributes: [
  			:id, :_destroy, :label, :question,
  			answers_attributes: [
  				:id, :_destroy, :answer
  			]
  		]
  	)
  end
end