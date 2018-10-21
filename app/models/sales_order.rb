class SalesOrder < ApplicationRecord
	belongs_to :product
	belongs_to :sales_invoice

	validates :sales_invoice_id, presence: true
	validates :product_id, presence: true
	validates :quantity, presence: true
end