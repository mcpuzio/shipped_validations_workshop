class SessionsController < ApplicationController
  def new
    
  end

  def create

    @user = User.where(username: params[:username]).first

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to boats_path
    else
      redirect_to log_in_path
    end
  	# user = User.find_by_email(params[:email])   
  	# if user && user.authenticate(params[:password])     
  	# 	session[:user_id] = user.id     
  	# 	redirect_to root_path, :notice => "Welcome back, #{user.email}"   
  	# else     
  	# 	flash[:alert] = "Invalid email or password"     
  	# 	render "new"   
  	# end
  end

  def destroy
    clear.sessions
    redirect_to new_session_path
  end
end
