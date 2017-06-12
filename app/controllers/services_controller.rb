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
    @booking = @service.bookings.build

    @service.questions.each do |q|
      @booking.my_answers.build(question: q)
    end

    if @service.visit?
      @booking.build_address
    end
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
    @booking = Service::Booking.new(booking_params)
    if @booking.save
      redirect_to service_path(params[:id]), notice: "Your booking request has been submitted. It will be reviewed by the professional and will get back to you."
    else
      render "show"
    end
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

  def booking_params
    params.require(:service_booking).permit(:user_id, :professional_user_id, :date, :notes, :service_service_id,
      my_answers_attributes: [
        :answer_id, :service_booking_id
      ],
      address_attributes: [
        :first_line, :second_line, :city, :state, :country, :address_type
      ]
    )
  end

  def validate_service_ownership
  	if @service.professional != current_user
  		redirect_to services_path, notice: "You do not own this service."
  	end
  end
end