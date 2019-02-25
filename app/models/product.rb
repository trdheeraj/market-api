class Product < ApplicationRecord
	has_many :sales_orders
	has_many :purchase_orders

	validates :name, presence: true,
			  uniqueness: { case_sensitive: false },
			  length: { minimum: 3, maximum: 50 }
	validates :quantity, presence: true,
			  numericality: { greater_than_or_equal_to: 0 }
	validates :rate, presence: true,
				numericality: { greater_than_or_equal_to: 0 }
	validates :hsn, presence: true
	validates :gst, presence: true
end