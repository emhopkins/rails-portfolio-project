class Building < ApplicationRecord
	belongs_to :landlord
	has_many :apartments
end
