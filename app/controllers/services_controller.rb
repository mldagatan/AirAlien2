class ServicesController < ApplicationController

	before_action :set_service, only: [:show, :edit, :update, :destroy, :book, :review]
	before_action :validate_service_ownership, only: [:edit, :update, :destroy, :review]
	before_action :is_user_professional, only: [:my_services, :new, :create, :review, :edit, :update, :destroy]

  def index
  	@services = Service::Service.approved
  end

  def my_services
  	@services = current_user.services
  end

  def show
  end

  def new
  	@service = current_user.services.build
    @service.build_address
  end

  def create
  	@service = Service::Service.new(service_params)
  	if @service.save
  		redirect_to edit_my_service_path(@service), notice: "Successfully created a service."
  	else
  		render "new"
  	end
  end

  def review
  end

  def edit
    if !@service.address.present?
      @service.build_address
    end
  end

  def update
  	if @service.update_attributes(service_params)
  		redirect_to edit_my_service_path(@service), notice: "Successfully updated a service."
  	else
  		render "edit"
  	end
  end

  def destroy
  	@service.destroy
  	redirect_to my_services_path, notice: "Successfully destroyed service."
  end

  def book
  end

  private
  def set_service
  	@service = Service::Service.find(params[:id])
  end

  def service_params
  	params.require(:service_service).permit(:title, :description, :rate, :discounted_rate, :service_category_id, :professional_id,
      address_attributes: [
        :id, :address_type, :first_line, :second_line, :city, :state, :country, :zip_code
      ],
  		images_attributes: [
  			:id, :_destroy, :img, :description
  		]
  	)
  end

  def validate_service_ownership
  	if @service.professional != current_user
  		redirect_to services_path, notice: "You do not own this service."
  	end
  end

  def is_user_professional
  	if !current_user.professional?
  		redirect_to services_path, notice: "You are not a professional yet."
  	end
  end
end