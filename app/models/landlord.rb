class Landlord < ApplicationRecord
	belongs_to :user
	has_many :buildings
	has_many :apartments, through: :buildings
	has_many :tenants, through: :apartments
	validates :name, presence: true
end
