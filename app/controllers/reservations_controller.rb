class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@reservation = current_user.reservations.create(reservation_params)

		redirect_to @reservation.experience, notice: "Your reservation has been created..."
	end

	def your_itineraries
		@itineraries = current_user.reservations
	end

	private
		def reservation_params
			params.require(:reservation).permit(:price, :total, :experience_id)
		end
end