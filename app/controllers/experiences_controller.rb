class ExperiencesController < ApplicationController

  before_action :set_experience, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index]

  def index
  	#@experiences = current_user.experiences
  end

  def show
  	@expphotos = @experience.expphotos
  end

  def new
  	@experience = current_user.experiences.build
  end

  def create
    @experience = current_user.experiences.build(experience_params)

    if @experience.save 

      if params[:images]
        params[:images].each do |image|
          @experience.expphotos.create(image: image)
        end
      end

      @expphotos = @experience.expphotos
      redirect_to edit_experience_path(@experience), notice: "Saved..."
    else
      render :new
    end
  end

  def edit
  	if current_user.id == @experience.user.id
  		@expphotos = @experience.expphotos
  	else
  		redirect_to root_path, notice: "You don't have permission."
  	end
  end

  def update
  	if @experience.update(experience_params)
  		if params[:images]
  			params[:images].each do |image|
  				@experience.expphotos.create(image: image)
  			end
  		end

  		redirect_to edit_experience_path(@experience), notice: "Updated..."

  		
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
