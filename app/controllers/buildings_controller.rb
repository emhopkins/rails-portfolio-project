class BuildingsController < ApplicationController

	def new
		@landlord = Landlord.find(params[:landlord_id])
		@building = Building.new
		@url = new_landlord_building_path(@landlord)
	end

	def create
		@landlord = Landlord.find(params[:id])
		@building = @landlord.buildings.build 
		@building.update_attributes(building_params)
		if @building.save
			redirect_to landlord_building_path(@building.landlord, @building)
		else 
			flash[:notice] = "The building couldn't be saved"
			redirect_to new_landlord_building_path(@landlord)
		end
	end

	def update
		@url =landlord_building_path
		@building = Building.find(params[:id])
		@building.update_attributes(building_params)
		if @building.save
			flash[:notice] = "The building was successfully saved"
			redirect_to landlord_building_path(@building.landlord, @building)
		else 
			flash[:notice] = "The building couldn't be saved"
			render :show 
		end
	end

	def show
		@building = Building.find(params[:id])
		@url =landlord_building_path
		if @building.apartments.size < @building.number_of_apartments
			new_apartment_forms = @building.number_of_apartments - @building.apartments.size
			new_apartment_forms.times { @building.apartments.build }
		end
	end

	private

	def building_params
		params.require(:building).permit(:name, :address, :landlord_id, :number_of_apartments, apartments_attributes: [:id, :unit, :rent, :description, :max_occupants, :building_id, characteristic_ids:[], characteristics_attributes: [:name], apartment_characteristics_attributes: [:quantity, :id]])
	end
end
