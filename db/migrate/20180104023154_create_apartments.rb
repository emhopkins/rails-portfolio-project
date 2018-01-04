class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :unit
      t.integer :building_id
      t.integer :max_occupants
      t.float :rent
      t.string :description

      t.timestamps
    end
  end
end
