class Apartment < ApplicationRecord
	belongs_to :building
	has_many :tenants
	has_many :apartment_characteristics
	has_many :characteristics, through: :apartment_characteristics
	validates :unit, presence: true
	validates_uniqueness_of :unit, scope: :building_id
	validates_numericality_of :rent
	accepts_nested_attributes_for :apartment_characteristics

	scope :can_house_more_than_3_tenants, -> { where("apartments.max_occupants > ?", 3) }

	def characteristics_attributes=(characteristic_attributes)
		characteristic_attributes.values.each do |characteristic_attribute|
		  if characteristic_attribute[:name].present?
		  	characteristic = Characteristic.find_or_create_by(characteristic_attribute)
		  	self.characteristics << characteristic
		  end
		end
	end
end
