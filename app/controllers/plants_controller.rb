class PlantsController < ApplicationController
	before_action :authorized, except: [:index, :fetch]

	def fetch
		response = RestClient.get("https://trefle.io/api/plants?token=a1I5V2VCUlh0UHJ0N3MvTG90dU9YQT09&complete_data=true&page_size=300")
		@api_data = JSON.parse(response.body)
		render json: @api_data, status: :ok
	end

	# response = RestClient.get(@@api_data[0].link) 
	# @second_fetch_data = JSON.parse(response.body)
	# render json: @second_fetch_data, status: :ok

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
