class Administration::ServicesController < AdministrationController
	before_action :set_service, only: [:status_update, :show]

  def index
  	@services = Service::Service.all
  end

  def status_update
  	if @service.update_attributes(status_update_params)
  		redirect_to administration_services_path, notice: "Successfully updated status of service."
  	else
  		render "index"
  	end
  end

  def show

  end

  private
  def set_service
  	@service = Service::Service.find(params[:id])
  end

  def status_update_params
  	params.require(:service_service).permit(:status)
  end
end
