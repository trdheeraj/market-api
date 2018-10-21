class Product < ApplicationRecord
	has_many :sales_orders
	has_many :purchase_orders

	validates :name, presence: true,
			  uniqueness: { case_sensitive: false },
			  length: { minimum: 3, maximum: 50 }
	validates :quantity, presence: true,
			  numericality: true,
	validates :rate, presence: true
	validates :hsn, presence: true
	validates :gst, presence: true
end