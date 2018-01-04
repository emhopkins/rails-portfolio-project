class LandlordsController < ApplicationController

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
			redirect_to new_landlord_path
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
