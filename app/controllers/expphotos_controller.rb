class ExpphotosController < ApplicationController

	def destroy
		@expphoto = Expphoto.find(params[:id])
		experience = @expphoto.experience

		@expphoto.destroy
		@expphotos = Expphoto.where(experience_id: experience.id)

		respond_to :js
	end
end