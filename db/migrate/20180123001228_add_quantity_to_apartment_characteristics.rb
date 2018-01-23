class AddQuantityToApartmentCharacteristics < ActiveRecord::Migration[5.1]
  def change
    add_column :apartment_characteristics, :quantity, :integer
  end
end
