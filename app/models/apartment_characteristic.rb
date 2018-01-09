class ApartmentCharacteristic < ApplicationRecord
	belongs_to :apartment  
	belongs_to :characteristic
end
