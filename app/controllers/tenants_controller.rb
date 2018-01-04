class TenantsController < ApplicationController
	def new
		@tenant = Tenant.new
	end

	def create
		@tenant = Tenant.new(name: tenant_params[:name], user: current_user)
		if @tenant.save
			@tenant.user.set_tenant_role
			redirect_to tenant_path(@tenant)
		else 
			flash[:notice] = "The tenant couldn't be saved"
			redirect_to new_tenant_path
		end
	end

	def show
		@tenant = Tenant.find(params[:id])
	end

	private

	def tenant_params
		params.require(:tenant).permit(:name, :apartment_id)
	end		
end
