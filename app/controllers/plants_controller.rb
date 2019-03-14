class PlantsController < ApplicationController
	before_action :authorized, except: [:index]

  def index
		@plants = Plant.all
		render json: @plants, status: :ok
	end

	def create
		@plant = Plant.new(plant_params)
		if @plant.save
			render json: @plant, status: :created
		else
			render json: @plant.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def plant_params
		params.require(:plant).permit(:image, :name, :breed, :summary, :water_history, :date_added)
	end

end
