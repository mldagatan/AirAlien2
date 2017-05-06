class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
  	@experiences = current_user.experiences
  end

  def show
  	
  end

  def new
  end

  def edit
  	
  end

  def create
  	@experiences = current_user.experiences.build(experience_params)

  	if @experience.save 
  		redirect_to @experience, notice: "Saved..."
  	else
  		render :new
 	end
  end

  def update
  	if @experience.update(experience_params)
  		redirect_to @experience, notice: "Updated..."
  	else
  		render :edit
  	end
  end

  private
  	def set_experience
  		@experience = Experience.find(params[:id])
  	end

  	def experience_params
  		params.require(:experience).permit(:day_type, :city, :category, :language, :experience_name, :experience_tagline)
  	end
end
