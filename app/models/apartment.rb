class Apartment < ApplicationRecord
	belongs_to :building
	has_many :tenants
	validates :unit, presence: true
	validates_uniqueness_of :unit, scope: :building_id
	validates_numericality_of :rent
end
