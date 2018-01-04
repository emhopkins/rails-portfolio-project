class BuildingsController < ApplicationController
	def new
		@building = Building.new
	end

	def create
		@building = Building.new(name: building_params[:name], user: current_user)
		if @building.save
			redirect_to building_path(@building)
		else 
			flash[:notice] = "The building couldn't be saved"
			redirect_to new_building_path
		end
	end

	def show
		@building = Building.find(params[:id])
	end

	private

	def building_params
		params.require(:building).permit(:name, :address, :landlord, :number_of_apartments, apartments_attributes: [:unit, :rent, :description, :max_occupants, :building])
	end
end
