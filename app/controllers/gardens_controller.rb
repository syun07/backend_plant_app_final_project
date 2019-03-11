class GardensController < ApplicationController
	def index
		@gardens = Garden.all
		render json: @gardens, status: :ok
	end

	def create
		@garden = Garden.new(user_id: garden_params['user_id'], plant_id: garden_params['plant_id'])
		if @garden.save
			render json: @garden, status: :created
		else
			render json: @garden.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def garden_params
		params.permit(:user_id, :plant_id)
	end
end
