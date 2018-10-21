class Address < ApplicationRecord
	has_one :customer
	has_one :supplier

	validates :address, presence: true
	validates :district, presence: true
	validates :postal_code, presence: true
end