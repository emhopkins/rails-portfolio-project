class ApartmentCharacteristic < ApplicationRecord
	belongs_to :apartment  
	belongs_to :characteristic
	validates :characteristic, uniqueness: { scope: :apartment }
	validates_numericality_of :quantity, allow_nil: true
end
