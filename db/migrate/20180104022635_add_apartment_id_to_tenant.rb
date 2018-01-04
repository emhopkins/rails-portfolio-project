class AddApartmentIdToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :apartment_id, :integer
  end
end
