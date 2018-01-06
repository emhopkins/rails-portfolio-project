class BuildingsController < ApplicationController
	def new
		@building = Building.new
	end

	def create
		@building = Building.new
		@building.update_attributes(building_params)
		if @building.save
			redirect_to building_path(@building)
		else 
			flash[:notice] = "The building couldn't be saved"
			redirect_to new_building_path
		end
	end

	def update
		@building = Building.find(params[:id])
		@building.update_attributes(building_params)
		if @building.save
			flash[:notice] = "The building was successfully saved"
			redirect_to building_path(@building)
		else 
			flash[:notice] = "The building couldn't be saved"
			render :show
		end
	end

	def show
		@building = Building.find(params[:id])
		if @building.apartments.size < @building.number_of_apartments
			new_apartment_forms = @building.number_of_apartments - @building.apartments.size
			new_apartment_forms.times { @building.apartments.build }
		end
	end

	private

	def building_params
		params.require(:building).permit(:name, :address, :landlord_id, :number_of_apartments, apartments_attributes: [:id, :unit, :rent, :description, :max_occupants, :building_id])
	end
end
