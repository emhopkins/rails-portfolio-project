class CreateLandlords < ActiveRecord::Migration[5.1]
  def change
    create_table :landlords do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
