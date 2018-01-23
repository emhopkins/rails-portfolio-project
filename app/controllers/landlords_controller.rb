class LandlordsController < ApplicationController

	def can_house_more_than_3_tenants
		@landlord = Landlord.find(params[:id])
	end

	def all
		@landlords = Landlord.all
		render :all
	end

	def new
		@landlord = Landlord.new
	end

	def create
		@landlord = Landlord.new(name: landlord_params[:name], user: current_user)
		if @landlord.save
			@landlord.user.set_landlord_role
			redirect_to landlord_path(@landlord)
		else 
			flash[:notice] = "The landlord couldn't be saved"
			render :new
		end
	end

	def show
		@landlord = Landlord.find(params[:id])
		@buildings = @landlord.buildings.all
	end

	private

	def landlord_params
		params.require(:landlord).permit(:name)
	end
end
