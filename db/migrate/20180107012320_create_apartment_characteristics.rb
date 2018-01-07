class CreateApartmentCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_characteristics do |t|
      t.integer :apartment_id
      t.integer :characteristic_id

      t.timestamps
    end
  end
end
