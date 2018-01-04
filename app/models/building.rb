class Building < ApplicationRecord
	belongs_to :landlord
	has_many :apartments
	accepts_nested_attributes_for :apartments
end
