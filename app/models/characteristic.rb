class Characteristic < ApplicationRecord
	has_many :apartment_characteristics
	has_many :apartments, through: :apartment_characteristics
end
