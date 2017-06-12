class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_professional, only: [:client_bookings, :show_client_bookings]
  before_action :set_booking, only: [:show, :edit, :show_client]

  def index
  	@bookings = current_user.bookings
  end

  def client_bookings
  	@bookings = current_user.client_bookings
  end

  def show_client
  end

  def show
  end

  def edit
  end

  private
  def set_booking
  	@booking = Service::Booking.find(params[:id])
  end
end