class UsersController < ApplicationController

	def index
		@user = User.all.reverse
			if !current_user
	  			redirect_to login_path
	    	end
	end

	def show
		@user = User.find(params[:id])
		@boats = @user.boats
	end
	

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
		session[:user_id] = @user.id
			redirect_to boats_path
	    else
	      redirect_to log_in_path
	    end
	end

	private

	def user_params
		params.require(:user).permit(:name, :username, :password_confirmation)
	end
end
