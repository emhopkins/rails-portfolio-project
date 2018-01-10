class Building < ApplicationRecord
	belongs_to :landlord
	has_many :apartments
	accepts_nested_attributes_for :apartments
	validates :name, presence: true
	validates_numericality_of :number_of_apartments

	scope :smallest_to_largest, -> { order("number_of_apartments asc") }
end
