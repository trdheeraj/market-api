class PurchaseOrder < ApplicationRecord
	belongs_to :product
	belongs_to :purchase_invoice

	validates :purchase_invoice_id, presence: true
	validates :product_id, presence: true
	validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end