class Apartment < ApplicationRecord
	belongs_to :building
	has_many :tenants
	has_many :apartment_characteristics
	has_many :characteristics, through: :apartment_characteristics
	validates :unit, presence: true
	validates_uniqueness_of :unit, scope: :building_id
	validates_numericality_of :rent
end
