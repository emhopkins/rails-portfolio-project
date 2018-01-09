class Apartment < ApplicationRecord
	belongs_to :building
	has_many :tenants
	has_many :apartment_characteristics
	has_many :characteristics, through: :apartment_characteristics
	validates :unit, presence: true
	validates_uniqueness_of :unit, scope: :building_id
	validates_numericality_of :rent
	accepts_nested_attributes_for :characteristics

	def characteristics_attributes=(characteristic_attributes)
		characteristic_attributes.values.each do |characteristic_attribute|
		  characteristic = Characteristic.find_or_create_by(characteristic_attribute)
		  self.characteristics << characteristic
		end
	end
end
