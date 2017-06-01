class ExpreservationsController < ApplicationController
	before_action :authenticate_user!, except: [:notify]


	def create 
		@expreservation = current_user.expreservations.create(expreservation_params)

		if @expreservation
			# send request to PayPal
			values = {
				business: 'gohiso-seller@gmail.com',
				cmd: '_xclick',
				upload: 1,
				notify_url: 'http://ec2-34-208-88-113.us-west-2.compute.amazonaws.com:3000/exp_notify',
				amount: @expreservation.total,
				item_name: @expreservation.experience.experience_name,
				item_number: @expreservation.id,
				quantity: '1',
				return: 'http://ec2-34-208-88-113.us-west-2.compute.amazonaws.com:3000/exp_your_itineraries'
			}

			redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
		else
			redirect_to @expreservation.room, alert: "Oops, something went wrong..."
		end 
	end

	protect_from_forgery except: [:notify]
	def exp_notify
		params.permit!
		status = params[:payment_status]

		expreservation = Expreservation.find(params[:item_number])

		if status == "Completed"
			expreservation.update_attributes status: true
		else
			expreservation.destroy
		end

		render nothing: true
	end

	protect_from_forgery except: [:exp_your_itineraries]
	def exp_your_itineraries
		@itineraries = current_user.expreservations
	end


	private 
		def expreservation_params
			params.require(:expreservation).permit(:price, :total, :experience_id)
		end
end