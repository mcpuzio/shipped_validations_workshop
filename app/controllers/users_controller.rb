class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end
	

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to '/'
		else
			redirect_to :back
		end	
	end

	private

	def user_params
		params.require(:user).permit(:name, :username, :password_confirmation)
	end
end
