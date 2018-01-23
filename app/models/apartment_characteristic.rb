class ApartmentCharacteristic < ApplicationRecord
	belongs_to :apartment  
	belongs_to :characteristic
	validates :characteristic, uniqueness: { scope: :apartment }
end
