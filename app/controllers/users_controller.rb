class UsersController < ApplicationController
	before_action :authorized, except: [:index, :create]

	def index
		@users = User.all
		render json: @users, status: :ok
	end

	def show
		@user = User.find(params[:id])
		render json: @user.as_json(:include => :plants), status: :ok
	end

	def create
		@user = User.new(user_params)
		if @user.save
			@token = encode_token(user_id: @user.id)
			@user.plants << Plant.first
			render json: { user: @user, jwt: @token }, status: :created
		else
			render json: @user.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.permit(:name, :password)
	end
end
