class BoatsController < ApplicationController
  
  def index
  	@boats = Boat.all 
  end

  def new
  	@boat = Boat.new(params[:id])
  end

  def show
  	@boat = Boat.find(params[:id])
  end

  def create
  	@boat = Boat.create(boat_params)
  	redirect_to @boat
  end

  def edit
  	@boat = Boat.find(params[:id])
  end

  def update
  	@boat = Boat.where(params[:id])
  	if @boat.update(params[:boat_id])
  		@boat.save
  		redirect_to @boat
  	else
  		redirect_to edit_boat_path
  	end
  end

  def destroy
  	@boat = Boat.find(params[:id])
  		 if @boat.destroy
  		 	flash[:notice] = "Post made!"
  		 else
  			flash[:alert] = "Failure!"
  		end
  		redirect_to boats_path
  end

  private

  def boat_params
  	params.require(:boat).permit(:boat_name, :container_capacity, :current_boat_location)
  end
end
